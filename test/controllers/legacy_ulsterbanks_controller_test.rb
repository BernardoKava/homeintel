require 'test_helper'

class LegacyUlsterbanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get legacy_ulsterbanks_index_url
    assert_response :success
  end

end
