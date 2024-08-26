require "test_helper"

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = skills(:typing)
  end

  test "有効なSkillオブジェクトを持つべきである" do
    unless @skill.valid?
      puts @skill.errors.full_messages
    end
    assert @skill.valid?
  end
end
