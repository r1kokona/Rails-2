require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    Capybara.javascript_driver = :cuprite
    Capybara.register_driver(:cuprite) do |app|
      Capybara::Cuprite::Driver.new(app, browser_options: { "no-sandbox": nil })
    end
    @user = users(:one)
  end
  test "visiting the index" do
    visit users_url
  
    assert_selector "h1", text: "Users"
  end
  test "ユーザー作成" do
    visit users_url
    click_on "New User"

    fill_in "Name", with: "New User"
    click_on "Create User"
    # リダイレクトする？
  end
  test "ユーザー情報アップデート" do
    visit user_url(@user)
    click_on "Edit", match: :first

    fill_in "Name", with: "Updated User"
    click_on "Update User"
  end
  test "ユーザー削除" do
    visit user_url(@user)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
  end
end
