require 'test_helper'

class CheckPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get check_points_index_url
    assert_response :success
  end

  test "should get new" do
    get check_points_new_url
    assert_response :success
  end

  test "should get create" do
    get check_points_create_url
    assert_response :success
  end

end
