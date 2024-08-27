require "test_helper"

class UserSkillTest < ActiveSupport::TestCase
  def setup
    @user = users(:mitsui)
    @skill = skills(:typing)
    @user_skill = UserSkill.new(user: @user, skill: @skill)
  end

  test "有効なUserSkillオブジェクトを持つべきである" do
    assert @user_skill.valid?
  end

  test "ユーザーが関連付けられている必要がある" do
    @user_skill.user = nil
    assert_not @user_skill.valid?
    assert_includes @user_skill.errors[:user], "can't be blank"
  end

  test "スキルが関連付けられている必要がある" do
    @user_skill.skill = nil
    assert_not @user_skill.valid?
    assert_includes @user_skill.errors[:skill], "can't be blank"
  end

  test "ユーザーと正しく関連付けられている" do
    assert_equal @user_skill.user, @user
  end

  test "スキルと正しく関連付けられている" do
    assert_equal @user_skill.skill, @skill
  end
end
