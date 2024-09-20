require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:mitsui)
    @user2 = users(:suzuki)
    @department1 = departments(:jinjibu)
    @department2 = departments(:eigyobu)
    @skill1 = skills(:typing)
    @skill2 = skills(:programing)
  end

  test "admin links" do
    get admin_users_path
    assert_response :success

    assert_select "h1", text: "Users"

    assert_select "ul" do
      assert_select "li", text: @user1.name
      assert_select "li", text: @user2.name
    end

    assert_select "a[href=?]", admin_user_path(@user1), text: @user1.name
    assert_select "a[href=?]", admin_user_path(@user2), text: @user2.name

    assert_select "a[href=?]", new_admin_user_path, text: "New User"

    get admin_departments_path
    assert_response :success
    assert_select "a[href=?]", admin_department_path(@department1), text: @department1.department_name
    assert_select "a[href=?]", admin_department_path(@department2), text: @department2.department_name
    assert_select "a[href=?]", new_admin_department_path, text: "New Department"

    get admin_skills_path
    assert_response :success
    assert_select "a[href=?]", admin_skill_path(@skill1), text: @skill1.name
    assert_select "a[href=?]", admin_skill_path(@skill2), text: @skill2.name
    assert_select "a[href=?]", new_admin_skill_path
  end
end
