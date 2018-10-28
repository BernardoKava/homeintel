require "application_system_test_case"

class EmployerpoolsTest < ApplicationSystemTestCase
  setup do
    @employerpool = employerpools(:one)
  end

  test "visiting the index" do
    visit employerpools_url
    assert_selector "h1", text: "Employerpools"
  end

  test "creating a Employerpool" do
    visit employerpools_url
    click_on "New Employerpool"

    fill_in "Active", with: @employerpool.active
    fill_in "Employer", with: @employerpool.employer
    fill_in "Sector", with: @employerpool.sector
    fill_in "User", with: @employerpool.user_id
    click_on "Create Employerpool"

    assert_text "Employerpool was successfully created"
    click_on "Back"
  end

  test "updating a Employerpool" do
    visit employerpools_url
    click_on "Edit", match: :first

    fill_in "Active", with: @employerpool.active
    fill_in "Employer", with: @employerpool.employer
    fill_in "Sector", with: @employerpool.sector
    fill_in "User", with: @employerpool.user_id
    click_on "Update Employerpool"

    assert_text "Employerpool was successfully updated"
    click_on "Back"
  end

  test "destroying a Employerpool" do
    visit employerpools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employerpool was successfully destroyed"
  end
end
