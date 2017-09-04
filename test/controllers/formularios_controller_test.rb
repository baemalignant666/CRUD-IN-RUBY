require 'test_helper'

class FormulariosControllerTest < ActionDispatch::IntegrationTest
  test "should get por_get" do
    get formularios_por_get_url
    assert_response :success
  end

  test "should get por_post" do
    get formularios_por_post_url
    assert_response :success
  end

end
