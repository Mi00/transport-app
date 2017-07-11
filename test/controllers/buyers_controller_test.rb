require 'test_helper'

class BuyersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buyers_index_url
    assert_response :success
  end

  test "should get edit" do
    get buyers_edit_url
    assert_response :success
  end

  test "should get new" do
    get buyers_new_url
    assert_response :success
  end

  test "should get show" do
    get buyers_show_url
    assert_response :success
  end

end
