require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill = skills(:typing)
  end

  test "部署が生成できデータが１つ増える" do
    assert_difference('Skill.count', +1) do
      post skills_path, params: { skill: {
        id: 3,
        name: "タイピング"
      }}
    end
    skill = skill.last
    assert_redirected_to skill_path(skill)
  end

  test "部署をupdateでき、データに変更がない" do
    assert_no_difference('Skill.count') do
      patch skill_url(@skill), params: { skill: { skill_name: "プログラミング" } }
    end
    assert_redirected_to skill_url(@skill)
    @skill.reload
    assert_equal "プログラミング", @skill.skill_name
  end

  test "ユーザーをdestroyでき一人へる" do
    assert_difference('skill.count', -1) do
      delete skill_path(@skill)
    end

    assert_redirected_to root_path
  end
  test "indexが取得できる" do
    get skills_path
    assert_response :success
    assert_select "h1", "Skills"
  end

  test "newが取得できる" do
    get new_skill_path
    assert_response :success
  end

  test "showが取得できる" do
    get skill_path(@skill)
    assert_response :success
    assert_select "h1", @skill.skill_name
  end

  test "editが取得できる" do
    get edit_skill_path(@skill)
    assert_response :success
    assert_select "h1", "Edit Skill"
  end
  test "newアクションで無効な値が送られた場合にエラーが出る" do
    post skills_path, params: { skill: { skill_name: " " } }
    assert_response :unprocessable_entity
  end

  test "editアクションで無効な値が送られた場合にエラーが出る" do
    patch skill_path(@skill), params: { skill: { skill_name: "" } }
    assert_response :unprocessable_entity
  end
end
