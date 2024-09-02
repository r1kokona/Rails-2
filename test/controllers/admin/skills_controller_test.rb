require "test_helper"

class Admin::SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill = skills(:typing)
  end

  test "部署が生成できデータが１つ増える" do
    assert_difference('Skill.count', +1) do
      post admin_skills_path, params: { skill: {
        id: 3,
        name: "タイピング"
      }}
    end
    skill = Skill.last
    assert_redirected_to admin_skill_path(skill)
  end

  test "部署をupdateでき、データに変更がない" do
    assert_no_difference('Skill.count') do
      patch admin_skill_url(@skill), params: { skill: { name: "プログラミング" } }
    end
    assert_redirected_to admin_skill_url(@skill)
    @skill.reload
    assert_equal "プログラミング", @skill.name
  end

  test "ユーザーをdestroyでき一人へる" do
    assert_difference('Skill.count', -1) do
      delete admin_skill_path(@skill)
    end

    assert_redirected_to root_path
  end
  test "indexが取得できる" do
    get admin_skills_path
    assert_response :success
    assert_select "h1", "Skills"
  end

  test "newが取得できる" do
    get new_admin_skill_path
    assert_response :success
  end

  test "showが取得できる" do
    get admin_skill_path(@skill)
    assert_response :success
    assert_select "h1", @skill.name
  end

  test "editが取得できる" do
    get edit_admin_skill_path(@skill)
    assert_response :success
    assert_select "h1", "Edit Skill"
  end
  test "newアクションで無効な値が送られた場合にエラーが出る" do
    post admin_skills_path, params: { skill: { name: " " } }
    assert_response :unprocessable_entity
  end

  test "editアクションで無効な値が送られた場合にエラーが出る" do
    patch admin_skill_path(@skill), params: { skill: { name: "" } }
    assert_response :unprocessable_entity
  end
end
