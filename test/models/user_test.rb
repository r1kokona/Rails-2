require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:mitsui)
  end
  test "有効である" do
    unless @user.valid?
      puts @user.errors.full_messages
    end

    assert @user.valid?
  end
  test "存在する名前である" do
    @user.name = "   "
    assert_not_nil @user.valid?
  end
end
