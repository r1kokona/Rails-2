require "test_helper"

class UserSkillTest < ActiveSupport::TestCase
  def setup
    @user = users(:mitsui)
    @skill = skills(:typing)
    @user_skill = UserSkill.new(user_id: @user.id, skill_id: @skill.id)
  end
  test "有効なUserSkillオブジェクトを持つべきである" do
    unless @user_skill.valid?
      puts @user_skill.errors.full_messages
    end
    assert @user_skill.valid?
  end

  test "ユーザーが関連付けられている必要がある" do
    @user_skill.user_id = nil
    assert_not @user_skill.valid?
    assert_includes @user_skill.errors[:user], "can't be blank"
  end

  test "スキルが関連付けられている必要がある" do
    @user_skill.skill_id = nil
    assert_not @user_skill.valid?
    assert_includes @user_skill.errors[:skill], "can't be blank"
  end

  test "ユーザーと正しく関連付けられている" do
    assert_equal @user_skill.user_id, @user.id
  end

  test "スキルと正しく関連付けられている" do
    assert_equal @user_skill.skill_id, @skill.id
  end
end
