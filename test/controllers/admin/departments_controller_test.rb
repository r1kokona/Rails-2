require "test_helper"

class Admin::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @department = departments(:jinjibu)
  end

  test "部署が生成できデータが１つ増える" do
    assert_difference('Department.count', +1) do
      post admin_departments_path, params: { department: {
        department_id: 3,
        department_name: "総務部"
      }}
    end
    department = Department.last
    assert_redirected_to admin_department_path(department)
  end

  test "部署をupdateでき、データに変更がない" do
    assert_no_difference('Department.count') do
      patch admin_department_url(@department), params: { department: { department_name: "代表取締役" } }
    end
    assert_redirected_to admin_department_url(@department)
    @department.reload
    assert_equal "代表取締役", @department.department_name
  end

  test "ユーザーをdestroyでき一人へる" do
    assert_difference('Department.count', -1) do
      delete admin_department_path(@department)
    end

    assert_redirected_to admin_departments_path
  end
  test "indexが取得できる" do
    get admin_departments_path
    assert_response :success
    assert_select "h1", "Departments"
  end

  test "newが取得できる" do
    get new_admin_department_path
    assert_response :success
  end

  test "showが取得できる" do
    get admin_department_path(@department)
    assert_response :success
    assert_select "h1", @department.department_name
  end

  test "editが取得できる" do
    get edit_admin_department_path(@department)
    assert_response :success
    assert_select "h1", "Edit department"
  end
  test "newアクションで無効な値が送られた場合にエラーが出る" do
    post admin_departments_path, params: { department: { department_name: " " } }
    assert_response :unprocessable_entity
  end

  test "editアクションで無効な値が送られた場合にエラーが出る" do
    patch admin_department_path(@department), params: { department: { department_name: "" } }
    assert_response :unprocessable_entity
  end
end
