require "test_helper"

class PersonalInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal = personal_informations(:mitsui)
  end
  test "個人情報を作成でき、データが一つ増える" do
    assert_difference('PersonalInformation.count') do
      post personal_informations_path, params: { personal_information: { name: @personal.name, address1: @personal.address1 } }
    end
    assert_redirected_to personal_informations_path(PersonalInformation.latest)
  end

  test "個人情報を削除でき、データが一つへる" do
    assert_difference('PersonalInformation.count', -1) do
      delete personal_informations_path(@personal)
    end
    assert_redirected_to root_path
  end
end
