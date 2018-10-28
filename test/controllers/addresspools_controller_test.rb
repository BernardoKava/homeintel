require 'test_helper'

class AddresspoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addresspool = addresspools(:one)
  end

  test "should get index" do
    get addresspools_url
    assert_response :success
  end

  test "should get new" do
    get new_addresspool_url
    assert_response :success
  end

  test "should create addresspool" do
    assert_difference('Addresspool.count') do
      post addresspools_url, params: { addresspool: { active: @addresspool.active, address: @addresspool.address, user_id: @addresspool.user_id } }
    end

    assert_redirected_to addresspool_url(Addresspool.last)
  end

  test "should show addresspool" do
    get addresspool_url(@addresspool)
    assert_response :success
  end

  test "should get edit" do
    get edit_addresspool_url(@addresspool)
    assert_response :success
  end

  test "should update addresspool" do
    patch addresspool_url(@addresspool), params: { addresspool: { active: @addresspool.active, address: @addresspool.address, user_id: @addresspool.user_id } }
    assert_redirected_to addresspool_url(@addresspool)
  end

  test "should destroy addresspool" do
    assert_difference('Addresspool.count', -1) do
      delete addresspool_url(@addresspool)
    end

    assert_redirected_to addresspools_url
  end
end
