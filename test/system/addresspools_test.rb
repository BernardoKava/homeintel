require "application_system_test_case"

class AddresspoolsTest < ApplicationSystemTestCase
  setup do
    @addresspool = addresspools(:one)
  end

  test "visiting the index" do
    visit addresspools_url
    assert_selector "h1", text: "Addresspools"
  end

  test "creating a Addresspool" do
    visit addresspools_url
    click_on "New Addresspool"

    fill_in "Active", with: @addresspool.active
    fill_in "Address", with: @addresspool.address
    fill_in "User", with: @addresspool.user_id
    click_on "Create Addresspool"

    assert_text "Addresspool was successfully created"
    click_on "Back"
  end

  test "updating a Addresspool" do
    visit addresspools_url
    click_on "Edit", match: :first

    fill_in "Active", with: @addresspool.active
    fill_in "Address", with: @addresspool.address
    fill_in "User", with: @addresspool.user_id
    click_on "Update Addresspool"

    assert_text "Addresspool was successfully updated"
    click_on "Back"
  end

  test "destroying a Addresspool" do
    visit addresspools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Addresspool was successfully destroyed"
  end
end
