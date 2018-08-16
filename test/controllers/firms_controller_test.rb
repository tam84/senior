require 'test_helper'

class FirmsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get firms_new_url
    assert_response :success
  end

  test "should get create" do
    get firms_create_url
    assert_response :success
  end

  test "should get index" do
    get firms_index_url
    assert_response :success
  end

  test "should get show" do
    get firms_show_url
    assert_response :success
  end

  test "should get edit" do
    get firms_edit_url
    assert_response :success
  end

  test "should get update" do
    get firms_update_url
    assert_response :success
  end

end
