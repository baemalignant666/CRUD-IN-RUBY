require 'test_helper'

class RedesSocialesControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get redes_sociales_facebook_url
    assert_response :success
  end

  test "should get twitter" do
    get redes_sociales_twitter_url
    assert_response :success
  end

  test "should get google_mas" do
    get redes_sociales_google_mas_url
    assert_response :success
  end

end
