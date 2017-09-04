require 'test_helper'

class TestCookiesControllerTest < ActionDispatch::IntegrationTest
  test "should get identificacion" do
    get test_cookies_identificacion_url
    assert_response :success
  end

end
