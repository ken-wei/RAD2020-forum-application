class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if (user && user.authenticate(params[:password]))
      log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      # Update user's active login time to so that the home page can display recent members
      user.update_attribute(:last_login, Time.now)
      redirect_to home_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
