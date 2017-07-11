require 'test_helper'

class PlnInvoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get pln_invoices_edit_url
    assert_response :success
  end

  test "should get index" do
    get pln_invoices_index_url
    assert_response :success
  end

  test "should get new" do
    get pln_invoices_new_url
    assert_response :success
  end

  test "should get show" do
    get pln_invoices_show_url
    assert_response :success
  end

end
