require 'test_helper'

class SellerPanelControllerTest < ActionDispatch::IntegrationTest
  test "should get producs" do
    get seller_panel_producs_url
    assert_response :success
  end

end
