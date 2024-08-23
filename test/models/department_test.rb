require "test_helper"

class DepartmentsTest < ActiveSupport::TestCase
  setup do
    @department = departments(:jinjibu)
  end
  test "部署テーブルのバリデーションが有効である" do
    unless @department.valid?
      puts @department.errors.full_messages
    end

    assert @department.valid?
  end
  test "存在する部署idである" do
    @department.department_id = "   "
    assert_not_nil @department.valid?
  end
  test "存在する部署名である" do
    @department.department_name = "   "
    assert_not_nil @department.valid?
  end

end
