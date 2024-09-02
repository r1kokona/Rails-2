require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "indexが取得できる" do
    get users_path
    assert_response :success
  end
end
