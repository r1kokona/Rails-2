RSpec.describe User, type: :model do
    fixtures :users
    let(:user) { users(:sato)}

    describe "validations" do
        it "有効な属性か" do
            expect(user).to be_valid
        end
        it "名前がない時無効" do
            user.name = nil
            expect(user).to_not be_valid
        end
        it "名前が空白の場合は無効" do
            user.name = " "
            expect(user).to_not be_valid
        end
        describe "database" do
            it "名前のカラムがある" do
                expect(User.column_names).to include("name")
            end
        end
    end
end