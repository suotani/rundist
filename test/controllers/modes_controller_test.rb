require 'test_helper'

class ModesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get modes_index_url
    assert_response :success
  end

  test "should get new" do
    get modes_new_url
    assert_response :success
  end

  test "should get create" do
    get modes_create_url
    assert_response :success
  end

end
