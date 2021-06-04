require "rails_helper"

RSpec.describe "セールス機能テスト", type: :system do
  describe "ユーザー認証" do
    before do
      FactoryBot.create(:testuser) #user = error になるのなんで？
      visit new_user_session_path
      fill_in("user[email]", with: "test@example.com")
      fill_in("user[password]", with: "test0141")
      click_on("ログイン")
    end
    context "各ページへのリンク確認" do
      it "ログイン後にマイページへ遷移するか" do
        aggregate_failures do
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_content "よろしくお願いします"
        end
      end
      it "各ページへのリンクが存在するか" do
        aggregate_failures do
          expect(page).to have_link "", href: "/posts/new"
          expect(page).to have_link "", href: "/users/edit"
        end
      end
      it "ナビゲーションバーのリンクが適切か" do
        aggregate_failures do
          expect(page).to have_link "", href: "/user/mypage"
          expect(page).to have_link "", href: "/notifications"
          expect(page).to have_link "", href: "/user/followers"
          expect(page).to have_link "", href: "/users/sign_out"
        end
      end
    end
    context "マイページの表示" do
      it "プロフィール" do
        aggregate_failures do
          expect(page).to have_content "田中 たかし"
        end
      end
    end
    context "ユーザー編集機能" do
      it "歯車アイコン押下 > introduction変更 > 更新" do
        aggregate_failures do
          find(:css, ".edit_link").click
          expect(current_path).to eq "/users/edit"
          fill_in("user[introduction]", with: "４月入社の新入社員です。")
          fill_in("user[current_password]", with: "test0141")
          find_button("Update").click
          expect(page).to have_content("４月入社の新入社員です。")
        end
      end
    end
    context "投稿機能" do
      before do
        first(:css, ".post_link").click
      end
      it "正しいフォーム・リンクが配置されているか" do
        aggregate_failures do
          expect(current_path).to eq("/posts/new")
          expect(page).to have_field("post[title]")
          expect(page).to have_field("post[contents]")
          expect(page).to have_select("post[category]")
          expect(page).to have_button("投稿する")
          expect(page).to have_link("マイページに戻る", href: "/user/mypage")
        end
      end
      it "正常にPOSTできるか" do
        aggregate_failures do
          # フォームの項目は全て入力させている。
          fill_in("post[title]", with: "投稿のテスト")
          fill_in("post[contents]",with: "投稿のテストを行います。")
          select "新製品", from: "post[category]"
          attach_file("post[post_image]", "app/assets/images/help-image.png")
          click_on "投稿する"
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_content("投稿のテスト")
        end
      end
    end
    context "ログアウトを押下" do
      it "ユーザーログインページへ遷移" do
         click_on("ログアウト", match: :first)
         expect(current_path).to eq "/users/sign_in"
      end
    end
  end
end