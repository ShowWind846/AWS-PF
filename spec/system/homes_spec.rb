require "rails_helper"

RSpec.describe "テスト" do
  describe "トップページ" do
    before do
      visit root_path
    end
    subject { page }
    context "リンクが存在するか" do
      it "test" do
        get ""
        expect(response.status).to eq 200
      end
      it "タイトルがroot_pathへのリンクになっているか" do
        is_expected.to have_link "SUGGESTooL", href: root_path
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
      it 'セールスログインページ' do
        is_expected.to have_link("ログイン", href: new_user_session_path)
      end
      it 'セールス新規登録ページ' do
        is_expected.to have_link("新規登録", href: new_user_registration_path)
      end
      it 'セールスアバウトページ' do
        is_expected.to have_link("サービスについて", href: user_about_path)
      end
      it 'ドクターログインページ' do
        is_expected.to have_link("ログイン", href: new_corp_session_path)
      end
      it 'ドクター新規登録ページ' do
        is_expected.to have_link("新規登録", href: new_corp_registration_path)
      end
      it 'ドクターアバウトページ' do
        is_expected.to have_link("サービスについて", href: corp_about_path)
      end
    end
  end
end