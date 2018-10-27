require "application_system_test_case"

class BaseItemsTest < ApplicationSystemTestCase
  setup do
    @base_item = base_items(:one)
  end

  test "visiting the index" do
    visit base_items_url
    assert_selector "h1", text: "Base Items"
  end

  test "creating a Base item" do
    visit base_items_url
    click_on "New Base Item"

    fill_in "Active", with: @base_item.active
    fill_in "Description", with: @base_item.description
    fill_in "Name", with: @base_item.name
    fill_in "Owner", with: @base_item.owner
    fill_in "User", with: @base_item.user_id
    click_on "Create Base item"

    assert_text "Base item was successfully created"
    click_on "Back"
  end

  test "updating a Base item" do
    visit base_items_url
    click_on "Edit", match: :first

    fill_in "Active", with: @base_item.active
    fill_in "Description", with: @base_item.description
    fill_in "Name", with: @base_item.name
    fill_in "Owner", with: @base_item.owner
    fill_in "User", with: @base_item.user_id
    click_on "Update Base item"

    assert_text "Base item was successfully updated"
    click_on "Back"
  end

  test "destroying a Base item" do
    visit base_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Base item was successfully destroyed"
  end
end
