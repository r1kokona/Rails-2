require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  setup do
    @user = users(:mitsui)
  end

  test "should format user name" do
    assert_equal "User: #{@user.name}", format_user_name(@user)
  end

  test "should return user greeting" do
    assert_equal "Hello, #{@user.name}!", user_greeting(@user)
  end
end
