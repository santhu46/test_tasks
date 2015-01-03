require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get verify_api" do
    get :verify_api
    assert_response :success
  end

end
