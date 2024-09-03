require "application_system_test_case"

class AdminDepartmentsTest < ApplicationSystemTestCase
  setup do
    Capybara.javascript_driver = :cuprite
    Capybara.register_driver(:cuprite) do |app|
      Capybara::Cuprite::Driver.new(app, browser_options: { "no-sandbox": nil })
    end
    @department = departments(:jinjibu)
  end
  test "Departmentが表示される" do
    visit admin_departments_path
  
    assert_selector "h1", text: "Departments"
  end
  test "部署作成" do
    visit admin_departments_path
    click_on "New Department"

    fill_in "Department name", with: "New Department"
    click_on "Create Department"
  end
  test "部署情報アップデート" do
    visit admin_department_path(@department)
    click_on "Edit", match: :first
  
    fill_in "Department name", with: "Updated Department"
    click_on "Update Department"
  end
  test "部署情報削除" do
    visit admin_department_path(@department)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
  end
end
