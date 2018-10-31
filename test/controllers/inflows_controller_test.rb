require 'test_helper'

class InflowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inflows_index_url
    assert_response :success
  end

end
