require "rails_helper"

RSpec.describe "セールス機能(E2E)", type: :system do
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
          expect(page).to have_link "マイページ", href: "/user/mypage"
          expect(page).to have_link "通知", href: "/notifications"
          expect(page).to have_link "フォロワー", href: "/user/followers"
          expect(page).to have_link "ログアウト", href: "/users/sign_out"
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
    context "投稿機能(Post)" do
      before "ポスト作成" do
        first(:css, ".post_link").click
        # 全てのフォームに値をセットする
        fill_in("post[title]", with: "投稿のテスト")
        fill_in("post[contents]",with: "投稿のテストを行います。")
        select "新製品", from: "post[category]"
        attach_file("post[post_image]", "app/assets/images/help-image.png")
        click_on "投稿する"
      end
      it "各リンク確認" do
        aggregate_failures do
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_content("投稿のテスト")
          expect(page).to have_css(".post_edit_link")
          expect(page).to have_css(".post_destroy_link")
        end
      end
      it "ポスト編集機能" do
        aggregate_failures "test" do
          find(:css, ".post_edit_link").click
          expect(page).to have_content("ポストを編集する")
          fill_in("post[title]", with: "新製品が発売しました。")
          find(:css, ".post_update_link").click
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_content("新製品が発売しました。")
        end
      end
      it "ポスト削除機能" do
        aggregate_failures do
          expect(page).to have_content("投稿のテスト")
          find(:css, ".post_destroy_link").click
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_no_content("投稿のテスト")
        end
      end
      it "編集せずにマイページへ戻る" do
        aggregate_failures do
          find(:css, ".post_edit_link").click
          find(:css, ".back_to_mypage").click
          expect(current_path).to eq "/user/mypage"
        end
      end
    end
    context "通知機能(Notification)" do
      # 通知機能テストのためには、ドクターからフォロー/メッセージが必要。
      it "遷移テスト" do
        aggregate_failures do
          expect(current_path).to eq "/user/mypage"
          expect(page).to have_link "通知", href: "/notifications"
          first(:css, "#to_notifications").click
          expect(current_path).to eq "/notifications"
        end
      end
      it "viewテスト" do
      end
      it "機能テスト" do
      end
    end
    context "フォロワー機能" do
      # フォロワー機能テストのためにはドクターからフォローが必要。
      it "フォロワー一覧ページ" do
      end
    end
    context "ログアウトを押下" do
      it "ユーザーログインページへ遷移" do
        expect(current_path).to eq "/user/mypage"
        click_on("ログアウト", match: :first)
        expect(current_path).to eq "/users/sign_in"
      end
    end
  end
end