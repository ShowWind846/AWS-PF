require "rails_helper"

RSpec.describe "User" do
  context "accesss" do
    before do
      get "/"
    end
    it "indexにアクセス可能か" do
      expect(response).to be_successful
    end
    it "リクエストが成功しているか" do
      expect(response.status).to eq 200
    end
  end
end