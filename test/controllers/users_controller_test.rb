require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user1 = users(:testuser)
    @user2 = users(:james)
  end
  
  test "should get new" do
    get new_path
    assert_response :success
  end

  test "should not redirect edit when not logged in" do
    get edit_user_path(@user1)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should render myprofile when logged in" do
    log_in_as(@user1)
    get myprofile_path(@user1)
    assert flash.empty?
    assert_template :myprofile
  end

  test "should redirect myprofile when not logged in" do
    get myprofile_path(@user1)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect myprofile when incorrect user" do
    log_in_as(@user1)
    get myprofile_path(@user2)
    assert_redirected_to root_url
  end


end
