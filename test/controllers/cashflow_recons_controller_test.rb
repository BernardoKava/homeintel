require 'test_helper'

class CashflowReconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cashflow_recon = cashflow_recons(:one)
  end

  test "should get index" do
    get cashflow_recons_url
    assert_response :success
  end

  test "should get new" do
    get new_cashflow_recon_url
    assert_response :success
  end

  test "should create cashflow_recon" do
    assert_difference('CashflowRecon.count') do
      post cashflow_recons_url, params: { cashflow_recon: { authorisation_date: @cashflow_recon.authorisation_date, authorised_by: @cashflow_recon.authorised_by, cashflow_id: @cashflow_recon.cashflow_id, correction_amount: @cashflow_recon.correction_amount, error_details: @cashflow_recon.error_details, reconciliation_rationale: @cashflow_recon.reconciliation_rationale, user_id: @cashflow_recon.user_id } }
    end

    assert_redirected_to cashflow_recon_url(CashflowRecon.last)
  end

  test "should show cashflow_recon" do
    get cashflow_recon_url(@cashflow_recon)
    assert_response :success
  end

  test "should get edit" do
    get edit_cashflow_recon_url(@cashflow_recon)
    assert_response :success
  end

  test "should update cashflow_recon" do
    patch cashflow_recon_url(@cashflow_recon), params: { cashflow_recon: { authorisation_date: @cashflow_recon.authorisation_date, authorised_by: @cashflow_recon.authorised_by, cashflow_id: @cashflow_recon.cashflow_id, correction_amount: @cashflow_recon.correction_amount, error_details: @cashflow_recon.error_details, reconciliation_rationale: @cashflow_recon.reconciliation_rationale, user_id: @cashflow_recon.user_id } }
    assert_redirected_to cashflow_recon_url(@cashflow_recon)
  end

  test "should destroy cashflow_recon" do
    assert_difference('CashflowRecon.count', -1) do
      delete cashflow_recon_url(@cashflow_recon)
    end

    assert_redirected_to cashflow_recons_url
  end
end
