require "rails_helper"

RSpec.describe "User_System_Spec", type: :system do
  describe "ユーザー認証" do
    before do
      user = FactoryBot.create(:testuser)
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
        expect(page).to have_link ".fa-edit", href: "/posts/new"
      end
    end
  end
end