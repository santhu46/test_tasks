require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get verify_email" do
    get :verify_email
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get get_email_verification" do
    get :get_email_verification
    assert_response :success
  end

end
