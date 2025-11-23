require "test_helper"

class PapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paper = papers(:one)
  end

  test "should get index" do
    get papers_url
    assert_response :success
  end

  test "should get new" do
    get new_paper_url
    assert_response :success
  end

  test "should create paper" do
    assert_difference("Paper.count") do
      post papers_url, params: { paper: { article: @paper.article, certificate: @paper.certificate, certificate_count: @paper.certificate_count, comment: @paper.comment, group: @paper.group, labtest: @paper.labtest, labtest_count: @paper.labtest_count, location_certificate: @paper.location_certificate, location_labtest: @paper.location_labtest, supplier_id: @paper.supplier_id, year: @paper.year } }
    end

    assert_redirected_to paper_url(Paper.last)
  end

  test "should show paper" do
    get paper_url(@paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_paper_url(@paper)
    assert_response :success
  end

  test "should update paper" do
    patch paper_url(@paper), params: { paper: { article: @paper.article, certificate: @paper.certificate, certificate_count: @paper.certificate_count, comment: @paper.comment, group: @paper.group, labtest: @paper.labtest, labtest_count: @paper.labtest_count, location_certificate: @paper.location_certificate, location_labtest: @paper.location_labtest, supplier_id: @paper.supplier_id, year: @paper.year } }
    assert_redirected_to paper_url(@paper)
  end

  test "should destroy paper" do
    assert_difference("Paper.count", -1) do
      delete paper_url(@paper)
    end

    assert_redirected_to papers_url
  end
end
