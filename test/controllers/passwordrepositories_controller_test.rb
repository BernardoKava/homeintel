require 'test_helper'

class PasswordrepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passwordrepositories_index_url
    assert_response :success
  end

end
