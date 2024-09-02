require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:mitsui)
    department = Department.create!(department_id:1, department_name: "Test Department")
  end
  test "ユーザー作成でき一人増える" do
    assert_difference('User.count', +1) do
      post admin_users_url, params: { user: {
        id: 100000,
        department_id: 1,
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
    assert_redirected_to admin_user_path(new_user)
  end
  test "ユーザーをupdateできる" do
    assert_no_difference('User.count') do
      patch admin_user_url(@user), params: { user: { name: "iii"}}
    end
    assert_redirected_to admin_user_path(@user)
    @user.reload
    assert_equal "iii", @user.name
  end
  test "ユーザーをdestroyでき一人へる" do
    assert_difference('User.count', -1) do
      delete admin_user_path(@user)
    end

    assert_redirected_to admin_users_path
  end
  test "indexが取得できる" do
    get admin_users_path
    assert_response :success
    assert_select "h1", "Users"
  end

  test "newが取得できる" do
    get new_admin_user_path
    assert_response :success
  end

  test "showが取得できる" do
    get admin_user_path(@user)
    assert_response :success
    assert_select "h1", @user.name
  end

  test "editが取得できる" do
    get edit_admin_user_path(@user)
    assert_response :success
    assert_select "h1", "Edit User"
  end
  test "newアクションで無効な値が送られた場合にエラーが出る" do
    post admin_users_path, params: { user: { name: "" } }
    assert_response :unprocessable_entity
  end

  test "editアクションで無効な値が送られた場合にエラーが出る" do
    patch admin_user_path(@user), params: { user: { name: "" } }
    assert_response :unprocessable_entity
  end
end
