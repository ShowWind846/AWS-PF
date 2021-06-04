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
          expect(current_path).to eq("/user/mypage")
          expect(page).to have_css ".post_link"
        end
      end
    end
    context "投稿機能(POST)" do
      before "仮の投稿をセット" do
        first(:css, ".post_link").click
        # 全てのフォームに値をセットする
        fill_in("post[title]", with: "投稿のテスト")
        fill_in("post[contents]",with: "投稿のテストを行います。")
        select "新製品", from: "post[category]"
        attach_file("post[post_image]", "app/assets/images/help-image.png")
        click_on "投稿する"
      end
      it "正常にPOSTできているか" do
        aggregate_failures do
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_content("投稿のテスト")
          expect(page).to have_css(".post_edit_link")
          expect(page).to have_css(".post_destroy_link")
        end
      end
      it "ポストを編集する。" do
        aggregate_failures "test" do
          find(:css, ".post_edit_link").click
          expect(page).to have_content("ポストを編集する")
          fill_in("post[title]", with: "新製品が発売しました。")
          find(:css, ".post_update_link").click
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_content("新製品が発売しました。")
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