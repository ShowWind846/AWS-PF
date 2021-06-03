RSpec.describe "メッセージ機能" do
  describe "MessageForm" do
    context "フォーム" do
      it "正常にポストできるか" do
        expect(FactoryBot.build(:message)).to be_valid
      end
    end
  end
end