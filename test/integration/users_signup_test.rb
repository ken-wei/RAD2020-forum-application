require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get new_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                 email: "invaliduser@invalid",
                                 password: "345",
                                 password_confirmation: "123"}}
    end
    assert_template 'users/new'
    assert_not is_logged_in?
  end

  test "valid signup information" do
    get new_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { 
                                 email: "user@example.com",
                                 password: "password",
                                 password_confirmation: "password",
                                 mobile: "0000000232"}}
    end
    follow_redirect!
    assert_template :index
    assert is_logged_in?
  end

end
