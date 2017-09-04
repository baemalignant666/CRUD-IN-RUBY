require 'test_helper'

class TestSesionesControllerTest < ActionDispatch::IntegrationTest
  test "should get iniciar_sesion" do
    get test_sesiones_iniciar_sesion_url
    assert_response :success
  end

  test "should get cerrar_sesion" do
    get test_sesiones_cerrar_sesion_url
    assert_response :success
  end

  test "should get bienvenida" do
    get test_sesiones_bienvenida_url
    assert_response :success
  end

end
