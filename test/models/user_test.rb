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
  test "存在するルビである" do
    @user.ruby = "   "
    assert_not_nil @user.valid?
  end
  test "存在する性別である" do
    @user.sex = "   "
    assert_not_nil @user.valid?
  end
  test "存在する固定電話の番号である" do
    @user.tel = "   "
    assert_not_nil @user.valid?
  end
  test "存在する電話番号である" do
    @user.mobile = "   "
    assert_not_nil @user.valid?
  end
  test "存在する郵便番号である" do
    @user.zip = "   "
    assert_not_nil @user.valid?
  end
  test "存在する住所である" do
    @user.address1 = "   "
    assert_not_nil @user.valid?
  end
  test "存在する生年月日である" do
    @user.birthday = "   "
    assert_not_nil @user.valid?
  end
end
