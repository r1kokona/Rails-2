require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "indexを取得する" do
    get users_url
    assert_response :success
    # assert_not_nil assigns(:users)
  end
  test "newを取得する" do
    get new_user_url
    assert_response :success
  end
  test "ユーザー作成できる" do
    assert_difference('User.count') do
      post users_url, params: { user: {name: "taro"}}
    end

    assert_redirected_to user_url(User.last)
  end
  test "ユーザーをshowできる" do
    get user_url(@user)
    assert_response :success
  end
  test "editを取得する" do
    get edit_user_url(@user)
    assert_response :success
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
