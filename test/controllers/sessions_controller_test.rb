require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end
  test "should get create" do
<<<<<<< HEAD
    get login_path
=======
    post login_path
>>>>>>> account-activation
    assert_response :success
  end
  test "should get destroy" do
    delete logout_path
    assert_response :success
  end

end
