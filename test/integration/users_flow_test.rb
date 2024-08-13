require 'test_helper'

class UsersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:mitsui) 
  end

  test "indexページが見れる" do
    get users_path
    assert_select "h1", "Users"
  end

  test "ユーザーがCreateできる" do
    get new_user_path
    assert_response :success

    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        id: 10000,
        name: "Test User",
        ruby: "Test User",
        sex: @user.sex,
        tel: @user.tel,
        mobile: @user.mobile,
        mail: @user.mail,
        zip: @user.zip,
        address1: @user.address1,
        address2: @user.address2,
        address3: @user.address3,
        address4: @user.address4,
        birthday: @user.birthday
      } }
    end

    follow_redirect!
    assert_response :success
    assert_select "h1", "Test User"
  end

  test "ユーザーがupdateできる" do
    get edit_user_path(@user)
    assert_response :success

    patch user_path(@user), params: { user: { name: "Updated Name" } }
    follow_redirect!
    assert_response :success
    assert_select "h1", "Updated Name"
  end

  test "ユーザーがdestroyできる" do
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end

    follow_redirect!
    assert_response :success
  end
end
