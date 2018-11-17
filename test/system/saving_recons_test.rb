require "application_system_test_case"

class SavingReconsTest < ApplicationSystemTestCase
  setup do
    @saving_recon = saving_recons(:one)
  end

  test "visiting the index" do
    visit saving_recons_url
    assert_selector "h1", text: "Saving Recons"
  end

  test "creating a Saving recon" do
    visit saving_recons_url
    click_on "New Saving Recon"

    fill_in "Authorisation Date", with: @saving_recon.authorisation_date
    fill_in "Authorised By", with: @saving_recon.authorised_by
    fill_in "Correction Amount", with: @saving_recon.correction_amount
    fill_in "Error Details", with: @saving_recon.error_details
    fill_in "Reconciliation Rationale", with: @saving_recon.reconciliation_rationale
    fill_in "Saving", with: @saving_recon.saving_id
    fill_in "User", with: @saving_recon.user_id
    click_on "Create Saving recon"

    assert_text "Saving recon was successfully created"
    click_on "Back"
  end

  test "updating a Saving recon" do
    visit saving_recons_url
    click_on "Edit", match: :first

    fill_in "Authorisation Date", with: @saving_recon.authorisation_date
    fill_in "Authorised By", with: @saving_recon.authorised_by
    fill_in "Correction Amount", with: @saving_recon.correction_amount
    fill_in "Error Details", with: @saving_recon.error_details
    fill_in "Reconciliation Rationale", with: @saving_recon.reconciliation_rationale
    fill_in "Saving", with: @saving_recon.saving_id
    fill_in "User", with: @saving_recon.user_id
    click_on "Update Saving recon"

    assert_text "Saving recon was successfully updated"
    click_on "Back"
  end

  test "destroying a Saving recon" do
    visit saving_recons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saving recon was successfully destroyed"
  end
end
