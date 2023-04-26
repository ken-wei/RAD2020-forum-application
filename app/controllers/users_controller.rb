class UsersController < ApplicationController
  before_action :logged_in_user, 
                only: [:update, :edit, :myprofile, :myposts,
                       :mycomments, :commentstome, :setting,
                       :password, :updatePassword, :avatar,
                       :updateAvatar, :verification, :uploadVerification]
  before_action :set_userid, 
                only: [:show, :update, :edit, 
                       :myprofile, :myposts, :mycomments,
                       :commentstome, :setting, :password, 
                       :updatePassword, :avatar, :updateAvatar,
                       :verification, :uploadVerification]
  before_action :correct_user,
                only: [:update, :edit, :myprofile, :myposts,
                       :mycomments, :commentstome, :setting,
                       :password, :updatePassword, :avatar,
                       :updateAvatar, :verification, :uploadVerification]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      # Update the user's last login time to for recent active members
      @user.update_attribute(:last_login, Time.now)
      redirect_to home_path
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(info_update_params)
      flash[:success] = "Profile updated"
      redirect_to myprofile_path(@user.id)
    else
      render 'setting'
    end
  end

  def updatePassword
    if @user.update_attributes(password_update_params)
      flash[:success] = "Password updated!"
      redirect_to myprofile_path(@user.id)
    else
      render 'password'
    end
  end

  def updateAvatar
    if !avatar_update_params[:avatar]
      flash[:success] = "Avatar remains unchanged!"
      redirect_to myprofile_path(@user.id)
    elsif @user.update_attributes(avatar_update_params)
      flash[:success] = "Avatar uploaded!"
      redirect_to myprofile_path(@user.id)
    else
      render 'avatar'
    end
  end

  def uploadVerification
    if @user.update_attributes(verification_params)
      flash[:success] = "Verification uploaded!"
      redirect_to myprofile_path(@user.id)
    else
      render 'verification'
    end
  end

  def verification
  end

  def avatar
  end

  def password
  end

  def show
  end

  def edit
  end

  def myprofile
  end

  def mycomments
  end

  def myposts
  end

  def setting
  end

  def commentstome
  end


  private

  def set_userid
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :mobile, :password, :password_confirmation)
  end

  # Updating personal info
  def info_update_params
    params.require(:user).permit(:username, :email, :mobile, :city, :introduction)
  end

  # For updating password
  def password_update_params
    params.permit(:password, :password_confirmation)
  end

  # For uploading avatar
  def avatar_update_params
    params.permit(:avatar)
  end

  # For verification page
  def verification_params
    params.permit(:cardno, :cardtype, :cardimage)
  end

  # Confirms if a user has logged in
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  # Check if the accessing user is the logged in user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
