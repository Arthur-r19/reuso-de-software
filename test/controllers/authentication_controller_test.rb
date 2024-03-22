require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get authentication_sign_in_url
    assert_response :success
  end

  test "should get sign_up" do
    get authentication_sign_up_url
    assert_response :success
  end

  test "should get logout" do
    get authentication_logout_url
    assert_response :success
  end
end
