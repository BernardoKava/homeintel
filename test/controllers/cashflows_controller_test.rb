require 'test_helper'

class CashflowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cashflow = cashflows(:one)
  end

  test "should get index" do
    get cashflows_url
    assert_response :success
  end

  test "should get new" do
    get new_cashflow_url
    assert_response :success
  end

  test "should create cashflow" do
    assert_difference('Cashflow.count') do
      post cashflows_url, params: { cashflow: { accounting_date: @cashflow.accounting_date, month: @cashflow.month, name: @cashflow.name, user_id: @cashflow.user_id, year: @cashflow.year } }
    end

    assert_redirected_to cashflow_url(Cashflow.last)
  end

  test "should show cashflow" do
    get cashflow_url(@cashflow)
    assert_response :success
  end

  test "should get edit" do
    get edit_cashflow_url(@cashflow)
    assert_response :success
  end

  test "should update cashflow" do
    patch cashflow_url(@cashflow), params: { cashflow: { accounting_date: @cashflow.accounting_date, month: @cashflow.month, name: @cashflow.name, user_id: @cashflow.user_id, year: @cashflow.year } }
    assert_redirected_to cashflow_url(@cashflow)
  end

  test "should destroy cashflow" do
    assert_difference('Cashflow.count', -1) do
      delete cashflow_url(@cashflow)
    end

    assert_redirected_to cashflows_url
  end
end
