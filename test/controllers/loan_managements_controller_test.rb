require 'test_helper'

class LoanManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_management = loan_managements(:one)
  end

  test "should get index" do
    get loan_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_management_url
    assert_response :success
  end

  test "should create loan_management" do
    assert_difference('LoanManagement.count') do
      post loan_managements_url, params: { loan_management: { amount: @loan_management.amount, loan_registration_id: @loan_management.loan_registration_id, month: @loan_management.month, note: @loan_management.note, payment_date: @loan_management.payment_date, user_id: @loan_management.user_id, year: @loan_management.year } }
    end

    assert_redirected_to loan_management_url(LoanManagement.last)
  end

  test "should show loan_management" do
    get loan_management_url(@loan_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_management_url(@loan_management)
    assert_response :success
  end

  test "should update loan_management" do
    patch loan_management_url(@loan_management), params: { loan_management: { amount: @loan_management.amount, loan_registration_id: @loan_management.loan_registration_id, month: @loan_management.month, note: @loan_management.note, payment_date: @loan_management.payment_date, user_id: @loan_management.user_id, year: @loan_management.year } }
    assert_redirected_to loan_management_url(@loan_management)
  end

  test "should destroy loan_management" do
    assert_difference('LoanManagement.count', -1) do
      delete loan_management_url(@loan_management)
    end

    assert_redirected_to loan_managements_url
  end
end
