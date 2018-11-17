require 'test_helper'

class SavingReconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saving_recon = saving_recons(:one)
  end

  test "should get index" do
    get saving_recons_url
    assert_response :success
  end

  test "should get new" do
    get new_saving_recon_url
    assert_response :success
  end

  test "should create saving_recon" do
    assert_difference('SavingRecon.count') do
      post saving_recons_url, params: { saving_recon: { authorisation_date: @saving_recon.authorisation_date, authorised_by: @saving_recon.authorised_by, correction_amount: @saving_recon.correction_amount, error_details: @saving_recon.error_details, reconciliation_rationale: @saving_recon.reconciliation_rationale, saving_id: @saving_recon.saving_id, user_id: @saving_recon.user_id } }
    end

    assert_redirected_to saving_recon_url(SavingRecon.last)
  end

  test "should show saving_recon" do
    get saving_recon_url(@saving_recon)
    assert_response :success
  end

  test "should get edit" do
    get edit_saving_recon_url(@saving_recon)
    assert_response :success
  end

  test "should update saving_recon" do
    patch saving_recon_url(@saving_recon), params: { saving_recon: { authorisation_date: @saving_recon.authorisation_date, authorised_by: @saving_recon.authorised_by, correction_amount: @saving_recon.correction_amount, error_details: @saving_recon.error_details, reconciliation_rationale: @saving_recon.reconciliation_rationale, saving_id: @saving_recon.saving_id, user_id: @saving_recon.user_id } }
    assert_redirected_to saving_recon_url(@saving_recon)
  end

  test "should destroy saving_recon" do
    assert_difference('SavingRecon.count', -1) do
      delete saving_recon_url(@saving_recon)
    end

    assert_redirected_to saving_recons_url
  end
end
