require "application_system_test_case"

class RentManagementsTest < ApplicationSystemTestCase
  setup do
    @rent_management = rent_managements(:one)
  end

  test "visiting the index" do
    visit rent_managements_url
    assert_selector "h1", text: "Rent Managements"
  end

  test "creating a Rent management" do
    visit rent_managements_url
    click_on "New Rent Management"

    fill_in "Amount", with: @rent_management.amount
    fill_in "Collected By", with: @rent_management.collected_by
    fill_in "Date Collected", with: @rent_management.date_collected
    fill_in "Details", with: @rent_management.details
    fill_in "Month", with: @rent_management.month
    fill_in "User", with: @rent_management.user_id
    fill_in "Year", with: @rent_management.year
    click_on "Create Rent management"

    assert_text "Rent management was successfully created"
    click_on "Back"
  end

  test "updating a Rent management" do
    visit rent_managements_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @rent_management.amount
    fill_in "Collected By", with: @rent_management.collected_by
    fill_in "Date Collected", with: @rent_management.date_collected
    fill_in "Details", with: @rent_management.details
    fill_in "Month", with: @rent_management.month
    fill_in "User", with: @rent_management.user_id
    fill_in "Year", with: @rent_management.year
    click_on "Update Rent management"

    assert_text "Rent management was successfully updated"
    click_on "Back"
  end

  test "destroying a Rent management" do
    visit rent_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rent management was successfully destroyed"
  end
end
