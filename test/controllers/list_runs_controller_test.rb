require "test_helper"

class ListRunsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get list_runs_show_url
    assert_response :success
  end

  test "should get new" do
    get list_runs_new_url
    assert_response :success
  end

  test "should get create" do
    get list_runs_create_url
    assert_response :success
  end

  test "should get edit" do
    get list_runs_edit_url
    assert_response :success
  end

  test "should get update" do
    get list_runs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get list_runs_destroy_url
    assert_response :success
  end
end
