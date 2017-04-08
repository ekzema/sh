require 'test_helper'

class AdminPanelControllerTest < ActionDispatch::IntegrationTest
  test "should get product_all" do
    get admin_panel_product_all_url
    assert_response :success
  end

end
