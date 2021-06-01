require "rails_helper"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "ユーザー新規登録" do
    it "有効な登録内容の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "Eメールに関して" do
      user = User.new(
        first_name: "太郎",
        last_name: "田中",
        email: "",
        password: "test0689",
        )
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end