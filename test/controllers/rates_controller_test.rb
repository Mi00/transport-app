require 'test_helper'

class RatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rates_index_url
    assert_response :success
  end

  test "should get new" do
    get rates_new_url
    assert_response :success
  end

end
