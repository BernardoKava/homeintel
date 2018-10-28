require "application_system_test_case"

class CashflowsTest < ApplicationSystemTestCase
  setup do
    @cashflow = cashflows(:one)
  end

  test "visiting the index" do
    visit cashflows_url
    assert_selector "h1", text: "Cashflows"
  end

  test "creating a Cashflow" do
    visit cashflows_url
    click_on "New Cashflow"

    fill_in "Accounting Date", with: @cashflow.accounting_date
    fill_in "Month", with: @cashflow.month
    fill_in "Name", with: @cashflow.name
    fill_in "User", with: @cashflow.user_id
    fill_in "Year", with: @cashflow.year
    click_on "Create Cashflow"

    assert_text "Cashflow was successfully created"
    click_on "Back"
  end

  test "updating a Cashflow" do
    visit cashflows_url
    click_on "Edit", match: :first

    fill_in "Accounting Date", with: @cashflow.accounting_date
    fill_in "Month", with: @cashflow.month
    fill_in "Name", with: @cashflow.name
    fill_in "User", with: @cashflow.user_id
    fill_in "Year", with: @cashflow.year
    click_on "Update Cashflow"

    assert_text "Cashflow was successfully updated"
    click_on "Back"
  end

  test "destroying a Cashflow" do
    visit cashflows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cashflow was successfully destroyed"
  end
end
