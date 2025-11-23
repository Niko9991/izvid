require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get supplier_report" do
    get reports_supplier_report_url
    assert_response :success
  end
end
