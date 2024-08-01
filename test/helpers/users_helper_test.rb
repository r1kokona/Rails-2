require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  setup do
    @user = User.new(name: "Example User")
  end

  test "should format user name" do
    assert_equal "User: Example User", format_user_name(@user)
  end

  test "should return user greeting" do
    assert_equal "Hello, Example User!", user_greeting(@user)
  end
end
