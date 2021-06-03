require "rails_helper"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "ユーザー新規登録" do
    it "有効な登録内容の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    context "アクセスのテスト" do
      it "" do
        get :show
        expect(response).to be_success
      end
    end
    context "空白のバリデーションチェック" do
      it "メールアドレス" do
        user = User.new(
          first_name: "太郎",
          last_name: "田中",
          email: "",
          password: "test0689",
          )
        expect(user).to be_invalid
        expect(user.errors[:email].join).to include("入力必須")
      end
      it "姓" do
        user = User.new(
          first_name: "太郎",
          last_name: "",
          email: "test@test.com",
          password: "test0689",
          )
        expect(user).to be_invalid
        expect(user.errors[:last_name].join).to include("入力必須")
      end
      it "名" do
        user = User.new(
          first_name: "",
          last_name: "田中",
          email: "test@test.com",
          password: "test0689",
          )
        expect(user).to be_invalid
        expect(user.errors[:first_name].join).to include("入力必須")
      end
      it "パスワード" do
        user = User.new(
          first_name: "太郎",
          last_name: "田中",
          email: "test@test.com",
          password: "",
          )
        expect(user).to be_invalid
        expect(user.errors[:password].join).to include("入力必須")
      end
    end
    context "ログインテスト" do
      before do
        @user = FactroyBot.build(:user)
      end
    end
  end
end