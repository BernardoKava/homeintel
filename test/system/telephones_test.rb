require "application_system_test_case"

class TelephonesTest < ApplicationSystemTestCase
  setup do
    @telephone = telephones(:one)
  end

  test "visiting the index" do
    visit telephones_url
    assert_selector "h1", text: "Telephones"
  end

  test "creating a Telephone" do
    visit telephones_url
    click_on "New Telephone"

    fill_in "Active", with: @telephone.active
    fill_in "Phone", with: @telephone.phone
    fill_in "User", with: @telephone.user_id
    click_on "Create Telephone"

    assert_text "Telephone was successfully created"
    click_on "Back"
  end

  test "updating a Telephone" do
    visit telephones_url
    click_on "Edit", match: :first

    fill_in "Active", with: @telephone.active
    fill_in "Phone", with: @telephone.phone
    fill_in "User", with: @telephone.user_id
    click_on "Update Telephone"

    assert_text "Telephone was successfully updated"
    click_on "Back"
  end

  test "destroying a Telephone" do
    visit telephones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Telephone was successfully destroyed"
  end
end
