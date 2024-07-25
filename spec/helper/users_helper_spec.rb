require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
   fixtures :users
   let(:user) { users(:one)}

    describe "#ユーザーの名前をフォーマットする" do
    it "フォーマットに沿った名前が返ってくる" do
            expect(helper.format_user_name(user)).to eq("User: MyString")
        end
    end
end