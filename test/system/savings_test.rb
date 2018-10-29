require "application_system_test_case"

class SavingsTest < ApplicationSystemTestCase
  setup do
    @saving = savings(:one)
  end

  test "visiting the index" do
    visit savings_url
    assert_selector "h1", text: "Savings"
  end

  test "creating a Saving" do
    visit savings_url
    click_on "New Saving"

    fill_in "Month", with: @saving.month
    fill_in "Name", with: @saving.name
    fill_in "Saving Date", with: @saving.saving_date
    fill_in "User", with: @saving.user_id
    fill_in "Year", with: @saving.year
    click_on "Create Saving"

    assert_text "Saving was successfully created"
    click_on "Back"
  end

  test "updating a Saving" do
    visit savings_url
    click_on "Edit", match: :first

    fill_in "Month", with: @saving.month
    fill_in "Name", with: @saving.name
    fill_in "Saving Date", with: @saving.saving_date
    fill_in "User", with: @saving.user_id
    fill_in "Year", with: @saving.year
    click_on "Update Saving"

    assert_text "Saving was successfully updated"
    click_on "Back"
  end

  test "destroying a Saving" do
    visit savings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saving was successfully destroyed"
  end
end
