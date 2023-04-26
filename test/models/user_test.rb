require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup 
    @user = User.new(email: "test@test.com", mobile: "0123456789",
                    password: "password", password_confirmation: "password")
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password and password_confirmation should be the same" do
    @user.password = @user.password_confirmation = "a" * 8
    assert @user.valid?
  end

  test "password and password_confirmation should be in between 8 and 20 characters" do
    @user.password = @user.password_confirmation = "a" * 15
    assert @user.valid?
  end

  test "password and password_confirmation should be minimum 8 characters" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "password and password_confirmation should be maximum 20 characters" do
    @user.password = @user.password_confirmation = "a" * 21
    assert_not @user.valid?
  end

  test "password and password_confirmation should contain only digits and words" do
    @user.password = @user.password_confirmation = "a" * 20
    assert @user.valid?
  end

  test "password and password_confirmation can contain only digits and words" do
    @user.password = @user.password_confirmation = "a1" * 10
    assert @user.valid?
  end

  test "password and password_confirmation should exclude special characters" do
    @user.password = @user.password_confirmation = "a1" * 10 + "!"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_barz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "mobile-no should be digits" do
    @user.mobile = "a" * 10
    assert_not @user.valid?
  end

  test "mobile-no should be in between 10 to 13 digits" do
    @user.mobile = "1" * 12
    assert @user.valid?
  end

  test "mobile-no should be minimum 10 digits" do
    @user.mobile = "1" * 9
    assert_not @user.valid?
  end

  test "mobile-no should be maximum 13 digits" do
    @user.mobile = "1" * 14
    assert_not @user.valid?
  end

end
