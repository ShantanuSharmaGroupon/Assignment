require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get logInregister" do
    get :logInregister
    assert_response :success
  end

end
