require "application_system_test_case"

class PapersTest < ApplicationSystemTestCase
  setup do
    @paper = papers(:one)
  end

  test "visiting the index" do
    visit papers_url
    assert_selector "h1", text: "Papers"
  end

  test "should create paper" do
    visit papers_url
    click_on "New paper"

    fill_in "Article", with: @paper.article
    fill_in "Certificate", with: @paper.certificate
    fill_in "Certificate count", with: @paper.certificate_count
    fill_in "Comment", with: @paper.comment
    fill_in "Group", with: @paper.group
    fill_in "Labtest", with: @paper.labtest
    fill_in "Labtest count", with: @paper.labtest_count
    fill_in "Location certificate", with: @paper.location_certificate
    fill_in "Location labtest", with: @paper.location_labtest
    fill_in "Supplier", with: @paper.supplier_id
    fill_in "Year", with: @paper.year
    click_on "Create Paper"

    assert_text "Paper was successfully created"
    click_on "Back"
  end

  test "should update Paper" do
    visit paper_url(@paper)
    click_on "Edit this paper", match: :first

    fill_in "Article", with: @paper.article
    fill_in "Certificate", with: @paper.certificate
    fill_in "Certificate count", with: @paper.certificate_count
    fill_in "Comment", with: @paper.comment
    fill_in "Group", with: @paper.group
    fill_in "Labtest", with: @paper.labtest
    fill_in "Labtest count", with: @paper.labtest_count
    fill_in "Location certificate", with: @paper.location_certificate
    fill_in "Location labtest", with: @paper.location_labtest
    fill_in "Supplier", with: @paper.supplier_id
    fill_in "Year", with: @paper.year
    click_on "Update Paper"

    assert_text "Paper was successfully updated"
    click_on "Back"
  end

  test "should destroy Paper" do
    visit paper_url(@paper)
    click_on "Destroy this paper", match: :first

    assert_text "Paper was successfully destroyed"
  end
end
