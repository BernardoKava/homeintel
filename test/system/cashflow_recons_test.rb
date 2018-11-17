require "application_system_test_case"

class CashflowReconsTest < ApplicationSystemTestCase
  setup do
    @cashflow_recon = cashflow_recons(:one)
  end

  test "visiting the index" do
    visit cashflow_recons_url
    assert_selector "h1", text: "Cashflow Recons"
  end

  test "creating a Cashflow recon" do
    visit cashflow_recons_url
    click_on "New Cashflow Recon"

    fill_in "Authorisation Date", with: @cashflow_recon.authorisation_date
    fill_in "Authorised By", with: @cashflow_recon.authorised_by
    fill_in "Cashflow", with: @cashflow_recon.cashflow_id
    fill_in "Correction Amount", with: @cashflow_recon.correction_amount
    fill_in "Error Details", with: @cashflow_recon.error_details
    fill_in "Reconciliation Rationale", with: @cashflow_recon.reconciliation_rationale
    fill_in "User", with: @cashflow_recon.user_id
    click_on "Create Cashflow recon"

    assert_text "Cashflow recon was successfully created"
    click_on "Back"
  end

  test "updating a Cashflow recon" do
    visit cashflow_recons_url
    click_on "Edit", match: :first

    fill_in "Authorisation Date", with: @cashflow_recon.authorisation_date
    fill_in "Authorised By", with: @cashflow_recon.authorised_by
    fill_in "Cashflow", with: @cashflow_recon.cashflow_id
    fill_in "Correction Amount", with: @cashflow_recon.correction_amount
    fill_in "Error Details", with: @cashflow_recon.error_details
    fill_in "Reconciliation Rationale", with: @cashflow_recon.reconciliation_rationale
    fill_in "User", with: @cashflow_recon.user_id
    click_on "Update Cashflow recon"

    assert_text "Cashflow recon was successfully updated"
    click_on "Back"
  end

  test "destroying a Cashflow recon" do
    visit cashflow_recons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cashflow recon was successfully destroyed"
  end
end
