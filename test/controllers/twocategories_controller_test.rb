require 'test_helper'

class TwocategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twocategories_index_url
    assert_response :success
  end

end
