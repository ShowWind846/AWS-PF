require "rails_helper"

RSpec.describe "ドクター機能(E2E)", type: :system do
  describe "Corpモデル" do
    before "アカウント作成" do
      visit "/"
      FactoryBot.create(:corp)
    end
    context "登録機能" do
      it "新規登録ページ > アクセス" do
        aggregate_failures do
          expect(current_path).to eq "/"
          expect(page).to have_link "新規登録", href: "/corps/sign_up"
          first(:css, "#to_corp_registration").click
          expect(current_path).to eq "/corps/sign_up"
        end
      end
      it "新規登録成功ケース" do
        aggregate_failures do
          expect(current_path).to eq "/"
          expect(page).to have_link "新規登録", href: "/corps/sign_up"
          first(:css, "#to_corp_registration").click
          expect(current_path).to eq "/corps/sign_up"
          fill_in("corp[last_name]", with: "加藤")
          fill_in("corp[first_name]", with: "元")
          fill_in("corp[hospital]", with: "加藤医院")
          select "東京都", from: "corp_area"
          fill_in("corp[email]", with: "kato@example.com")
          fill_in("corp[password]", with: "testdoctor0141")
          fill_in("corp[password_confirmation]", with: "testdoctor0141")
          find(:css, "#to_submit").click
          expect(current_path).to eq "/corp/mypage"
          expect(page).to have_content "加藤"
        end
      end
      it "ログイン可能か" do
        aggregate_failures do
          expect(current_path).to eq "/"
          expect(page).to have_link "ログイン", href: "/corps/sign_in"
          first(:css, "#to_corp_login").click
          expect(current_path).to eq "/corps/sign_in"
          fill_in("corp[email]", with: "corp@example.com")
          fill_in("corp[password]", with: "testcorp0141")
          find(:css, "#submit_btn").click
          expect(page).to have_content("ログインしました")
          expect(page).to have_content("斎藤")
        end
      end
    end
    context "編集機能 ・ ログアウト確認" do
      before "ログイン" do
        first(:css, "#to_corp_login").click
        fill_in("corp[email]", with: "corp@example.com")
        fill_in("corp[password]", with: "testcorp0141")
        find(:css, "#submit_btn").click
        expect(current_path).to eq "/corp/mypage"
      end
      it "ログアウト可能か" do
        first(:css, "#to_logout").click
        expect(current_path).to eq "/corps/sign_in"
      end
      it "編集機能 成功" do
        # 姓・名・紹介文の編集 > 更新後表示変更確認
        aggregate_failures do
          expect(page).to have_css("#to_edit")
          find(:css, "#to_edit").click
          expect(current_path).to eq "/corps/edit"
          fill_in("corp[last_name]", with: "安藤")
          fill_in("corp[first_name]", with: "雄一")
          fill_in("corp[introduction]", with: "2020年4月開院。")
          fill_in("corp[current_password]", with: "testcorp0141")
          find(:css, "#to_update").click
          expect(current_path).to eq "/corp/mypage"
          expect(page).to have_content("安藤")
          expect(page).to have_content("雄一")
          expect(page).to have_content("2020年4月開院。")
        end
      end
      it "編集機能 失敗" do
        # パスワード未入力 > エラーメッセージ表示確認
        aggregate_failures do
          find(:css, "#to_edit").click
          fill_in("corp[last_name]",with: "安藤")
          find(:css, "#to_update").click
          expect(page).to have_content "エラーが発生"
        end
      end
    end
    context "通知機能" do
      before do
        first(:css, "#to_corp_login").click
        fill_in("corp[email]", with: "corp@example.com")
        fill_in("corp[password]", with: "testcorp0141")
        find(:css, "#submit_btn").click
        expect(current_path).to eq "/corp/mypage"
      end
      it "通知一覧ページ > アクセス" do
        expect(page).to have_link "通知", href: "/notifications"
        first(:css, "#to_notifications").click
        expect(current_path).to eq "/notifications"
        expect(page).to have_content "最新の通知"
      end
      it "通知機能" do
      end
    end
  end
end