require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "ユーザー作成できる" do
    assert_difference('User.count') do
      post users_url, params: { user: {name: "taro"}}
    end

    assert_redirected_to user_url(User.last)
  end
  test "ユーザーをupdateできる" do
    patch user_url(@user), params: { user: { name: "iii"}}
    assert_redirected_to user_url(@user)
  end
  test "ユーザーをdestroyできる" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_path
  end
end
