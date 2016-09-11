require 'test_helper'

class CategorySlideImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get category_slide_images_create_url
    assert_response :success
  end

end
