require 'test_helper'

class RentManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rent_management = rent_managements(:one)
  end

  test "should get index" do
    get rent_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_rent_management_url
    assert_response :success
  end

  test "should create rent_management" do
    assert_difference('RentManagement.count') do
      post rent_managements_url, params: { rent_management: { amount: @rent_management.amount, collected_by: @rent_management.collected_by, date_collected: @rent_management.date_collected, details: @rent_management.details, month: @rent_management.month, user_id: @rent_management.user_id, year: @rent_management.year } }
    end

    assert_redirected_to rent_management_url(RentManagement.last)
  end

  test "should show rent_management" do
    get rent_management_url(@rent_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_rent_management_url(@rent_management)
    assert_response :success
  end

  test "should update rent_management" do
    patch rent_management_url(@rent_management), params: { rent_management: { amount: @rent_management.amount, collected_by: @rent_management.collected_by, date_collected: @rent_management.date_collected, details: @rent_management.details, month: @rent_management.month, user_id: @rent_management.user_id, year: @rent_management.year } }
    assert_redirected_to rent_management_url(@rent_management)
  end

  test "should destroy rent_management" do
    assert_difference('RentManagement.count', -1) do
      delete rent_management_url(@rent_management)
    end

    assert_redirected_to rent_managements_url
  end
end
