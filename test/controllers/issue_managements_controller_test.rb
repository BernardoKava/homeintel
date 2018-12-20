require 'test_helper'

class IssueManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue_management = issue_managements(:one)
  end

  test "should get index" do
    get issue_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_issue_management_url
    assert_response :success
  end

  test "should create issue_management" do
    assert_difference('IssueManagement.count') do
      post issue_managements_url, params: { issue_management: { completion_actual_date: @issue_management.completion_actual_date, completion_rate: @issue_management.completion_rate, completion_target_date: @issue_management.completion_target_date, description: @issue_management.description, issue_owner: @issue_management.issue_owner, issue_title: @issue_management.issue_title } }
    end

    assert_redirected_to issue_management_url(IssueManagement.last)
  end

  test "should show issue_management" do
    get issue_management_url(@issue_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_management_url(@issue_management)
    assert_response :success
  end

  test "should update issue_management" do
    patch issue_management_url(@issue_management), params: { issue_management: { completion_actual_date: @issue_management.completion_actual_date, completion_rate: @issue_management.completion_rate, completion_target_date: @issue_management.completion_target_date, description: @issue_management.description, issue_owner: @issue_management.issue_owner, issue_title: @issue_management.issue_title } }
    assert_redirected_to issue_management_url(@issue_management)
  end

  test "should destroy issue_management" do
    assert_difference('IssueManagement.count', -1) do
      delete issue_management_url(@issue_management)
    end

    assert_redirected_to issue_managements_url
  end
end
