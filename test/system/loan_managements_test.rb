require "application_system_test_case"

class LoanManagementsTest < ApplicationSystemTestCase
  setup do
    @loan_management = loan_managements(:one)
  end

  test "visiting the index" do
    visit loan_managements_url
    assert_selector "h1", text: "Loan Managements"
  end

  test "creating a Loan management" do
    visit loan_managements_url
    click_on "New Loan Management"

    fill_in "Amount", with: @loan_management.amount
    fill_in "Loan Registration", with: @loan_management.loan_registration_id
    fill_in "Month", with: @loan_management.month
    fill_in "Note", with: @loan_management.note
    fill_in "Payment Date", with: @loan_management.payment_date
    fill_in "User", with: @loan_management.user_id
    fill_in "Year", with: @loan_management.year
    click_on "Create Loan management"

    assert_text "Loan management was successfully created"
    click_on "Back"
  end

  test "updating a Loan management" do
    visit loan_managements_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @loan_management.amount
    fill_in "Loan Registration", with: @loan_management.loan_registration_id
    fill_in "Month", with: @loan_management.month
    fill_in "Note", with: @loan_management.note
    fill_in "Payment Date", with: @loan_management.payment_date
    fill_in "User", with: @loan_management.user_id
    fill_in "Year", with: @loan_management.year
    click_on "Update Loan management"

    assert_text "Loan management was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan management" do
    visit loan_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan management was successfully destroyed"
  end
end
