require 'test_helper'

class OutflowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get outflows_index_url
    assert_response :success
  end

end
