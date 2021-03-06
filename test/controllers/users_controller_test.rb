require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=users(:gulfam)
  end
  test "should get new" do
    get signup_path
    assert_response :success
  end
  test "should redirect edit when logged in as wrong user" do

    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  # test "should redirect destroy when logged in as a non-admin" do
  #   log_in_as(@other_user)
  #   assert_no_difference 'User.count' do
  #     delete user_path(@user)
  #   end
  #   assert_redirected_to root_url
  # end
  # test "index as admin including pagination and delete links" do
  #   log_in_as(@admin)
  #   get users_path
  #   assert_template 'users/index'
  #   assert_select 'div.pagination'
  #   first_page_of_users = User.paginate(page: 1)
  #   first_page_of_users.each do |user|
  #     assert_select 'a[href=?]', user_path(user), text: user.name
  #     unless user == @admin
  #       assert_select 'a[href=?]', user_path(user), text: 'delete'
  #     end
  #   end
  #   assert_difference 'User.count', -1 do
  #     delete user_path(@non_admin)
  #   end
  # end

  # test "index as non-admin" do
  #   log_in_as(@non_admin)
  #   get users_path
  #   assert_select 'a', text: 'delete', count: 0
  # end

end
