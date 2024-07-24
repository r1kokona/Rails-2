require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "indexを取得する" do
    get users_path
    assert_response :success
  end
end
