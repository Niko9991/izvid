require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get razlaga" do
    get home_razlaga_url
    assert_response :success
  end
end
