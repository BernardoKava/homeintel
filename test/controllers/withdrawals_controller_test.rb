require 'test_helper'

class WithdrawalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get withdrawals_index_url
    assert_response :success
  end

end
