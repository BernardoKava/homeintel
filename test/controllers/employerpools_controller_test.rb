require 'test_helper'

class EmployerpoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employerpool = employerpools(:one)
  end

  test "should get index" do
    get employerpools_url
    assert_response :success
  end

  test "should get new" do
    get new_employerpool_url
    assert_response :success
  end

  test "should create employerpool" do
    assert_difference('Employerpool.count') do
      post employerpools_url, params: { employerpool: { active: @employerpool.active, employer: @employerpool.employer, sector: @employerpool.sector, user_id: @employerpool.user_id } }
    end

    assert_redirected_to employerpool_url(Employerpool.last)
  end

  test "should show employerpool" do
    get employerpool_url(@employerpool)
    assert_response :success
  end

  test "should get edit" do
    get edit_employerpool_url(@employerpool)
    assert_response :success
  end

  test "should update employerpool" do
    patch employerpool_url(@employerpool), params: { employerpool: { active: @employerpool.active, employer: @employerpool.employer, sector: @employerpool.sector, user_id: @employerpool.user_id } }
    assert_redirected_to employerpool_url(@employerpool)
  end

  test "should destroy employerpool" do
    assert_difference('Employerpool.count', -1) do
      delete employerpool_url(@employerpool)
    end

    assert_redirected_to employerpools_url
  end
end
