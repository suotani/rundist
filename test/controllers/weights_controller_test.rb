require 'test_helper'

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weights_index_url
    assert_response :success
  end

  test "should get new" do
    get weights_new_url
    assert_response :success
  end

  test "should get create" do
    get weights_create_url
    assert_response :success
  end

end
