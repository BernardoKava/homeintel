require 'test_helper'

class LoanRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_registration = loan_registrations(:one)
  end

  test "should get index" do
    get loan_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_registration_url
    assert_response :success
  end

  test "should create loan_registration" do
    assert_difference('LoanRegistration.count') do
      post loan_registrations_url, params: { loan_registration: { amount: @loan_registration.amount, drawdown_date: @loan_registration.drawdown_date, final_payment_date: @loan_registration.final_payment_date, financialinstitution_id: @loan_registration.financialinstitution_id, loan_reference: @loan_registration.loan_reference, loan_term: @loan_registration.loan_term, loan_type: @loan_registration.loan_type, person_id: @loan_registration.person_id, rationale: @loan_registration.rationale, user_id: @loan_registration.user_id } }
    end

    assert_redirected_to loan_registration_url(LoanRegistration.last)
  end

  test "should show loan_registration" do
    get loan_registration_url(@loan_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_registration_url(@loan_registration)
    assert_response :success
  end

  test "should update loan_registration" do
    patch loan_registration_url(@loan_registration), params: { loan_registration: { amount: @loan_registration.amount, drawdown_date: @loan_registration.drawdown_date, final_payment_date: @loan_registration.final_payment_date, financialinstitution_id: @loan_registration.financialinstitution_id, loan_reference: @loan_registration.loan_reference, loan_term: @loan_registration.loan_term, loan_type: @loan_registration.loan_type, person_id: @loan_registration.person_id, rationale: @loan_registration.rationale, user_id: @loan_registration.user_id } }
    assert_redirected_to loan_registration_url(@loan_registration)
  end

  test "should destroy loan_registration" do
    assert_difference('LoanRegistration.count', -1) do
      delete loan_registration_url(@loan_registration)
    end

    assert_redirected_to loan_registrations_url
  end
end
