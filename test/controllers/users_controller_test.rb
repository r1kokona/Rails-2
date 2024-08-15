require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:mitsui)
  end
  test "ユーザー作成でき一人増える" do
    assert_difference('User.count', +1) do
      post users_url, params: { user: {
        id: 100000,
        name: "Test User",
        ruby: "Test User",
        sex: "女",
        tel: "0989999999",
        mobile: "",
        mail: "mi@ac.jp",
        zip: "9052171",
        address1: "沖縄県",
        address2: "",
        address3: "",
        address4: "",
        birthday: "2014/01/01"
      } }
    end
    new_user = User.last
    assert_redirected_to user_path(new_user)
  end
  test "ユーザーをupdateできる" do
    patch user_url(@user), params: { user: { name: "iii"}}
    assert_redirected_to @user
    @user.reload
    assert_equal "iii", @user.name
  end
  test "ユーザーをdestroyでき一人へる" do
    assert_difference('User.count', -1) do
      delete user_path(@user)
    end

    assert_redirected_to root_path
  end
end
