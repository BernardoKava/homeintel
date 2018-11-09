require 'test_helper'

class LodgementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lodgements_index_url
    assert_response :success
  end

end
