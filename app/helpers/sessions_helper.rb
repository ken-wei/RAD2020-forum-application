module SessionsHelper
    # Log in the user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Get the current logged in user
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token]) 
                log_in user
                @current_user = user
            end
        end
    end

    # Returns true user is logged in, false if not logged in
    def logged_in?
        !current_user.nil?
    end

    # Forgets a persistent session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    # Log out the logged in user
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    # Returns true if the given user is the current user
    def current_user?(user)
        user.id == session[:user_id]
    end

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

end
