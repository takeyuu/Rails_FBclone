require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get pictures_top_url
    assert_response :success
  end

end
