require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name:"Example User")
  end
  test "有効である" do
    assert @user.valid?
  end
  test "存在する名前である" do
    @user.name = "   "
    assert_not_nil @user.valid?
  end
end
