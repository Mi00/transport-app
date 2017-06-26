require 'test_helper'

class FuelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fuel_index_url
    assert_response :success
  end

  test "should get new" do
    get fuel_new_url
    assert_response :success
  end

  test "should get show" do
    get fuel_show_url
    assert_response :success
  end

  test "should get create" do
    get fuel_create_url
    assert_response :success
  end

  test "should get update" do
    get fuel_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fuel_destroy_url
    assert_response :success
  end

end
