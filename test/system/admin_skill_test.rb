require "application_system_test_case"

class SkillsTest < ApplicationSystemTestCase
    setup do
        Capybara.javascript_driver = :cuprite
        Capybara.register_driver(:cuprite) do |app|
          Capybara::Cuprite::Driver.new(app, browser_options: { "no-sandbox": nil })
        end
        @skill = skills(:typing)
    end
    test "indexが表示される" do
        visit admin_skills_path
        
        assert_selector "h1", text: "Skills"
    end
    test "ユーザー作成" do
        visit admin_skills_path
        click_on "New Skill"
        
        fill_in "Name", with: "New Skill"
        click_on "Create Skill"
    end
    test "ユーザー情報アップデート" do
        visit admin_skill_path(@skill)
        click_on "Edit", match: :first
    
        fill_in "Name", with: "Updated Skill"
        click_on "Update Skill"
    end
    test "ユーザー削除" do
        visit admin_skill_path(@skill)
        page.accept_confirm do
            click_on "Destroy", match: :first
        end
    end
end