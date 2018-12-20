require "application_system_test_case"

class IssueManagementsTest < ApplicationSystemTestCase
  setup do
    @issue_management = issue_managements(:one)
  end

  test "visiting the index" do
    visit issue_managements_url
    assert_selector "h1", text: "Issue Managements"
  end

  test "creating a Issue management" do
    visit issue_managements_url
    click_on "New Issue Management"

    fill_in "Completion Actual Date", with: @issue_management.completion_actual_date
    fill_in "Completion Rate", with: @issue_management.completion_rate
    fill_in "Completion Target Date", with: @issue_management.completion_target_date
    fill_in "Description", with: @issue_management.description
    fill_in "Issue Owner", with: @issue_management.issue_owner
    fill_in "Issue Title", with: @issue_management.issue_title
    click_on "Create Issue management"

    assert_text "Issue management was successfully created"
    click_on "Back"
  end

  test "updating a Issue management" do
    visit issue_managements_url
    click_on "Edit", match: :first

    fill_in "Completion Actual Date", with: @issue_management.completion_actual_date
    fill_in "Completion Rate", with: @issue_management.completion_rate
    fill_in "Completion Target Date", with: @issue_management.completion_target_date
    fill_in "Description", with: @issue_management.description
    fill_in "Issue Owner", with: @issue_management.issue_owner
    fill_in "Issue Title", with: @issue_management.issue_title
    click_on "Update Issue management"

    assert_text "Issue management was successfully updated"
    click_on "Back"
  end

  test "destroying a Issue management" do
    visit issue_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Issue management was successfully destroyed"
  end
end
