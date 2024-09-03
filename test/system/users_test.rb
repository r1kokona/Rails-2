require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:mitsui)
  end

  test "indexが表示される" do
    visit users_path
  
    assert_selector "h1", text: "Users"
  end
  test "showが表示される" do
    visit user_path(@user)

    assert_selector "h1", text: @user.name
  end
end
