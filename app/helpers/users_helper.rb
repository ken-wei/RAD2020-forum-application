module UsersHelper
    
    # Gravatar class for home page
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        return image_tag(user.avatar, alt: user.email, class: "gravatar") if user.avatar.attached?
        image_tag(gravatar_url, alt: user.email, class: "gravatar")
    end

    # Gravatar class for user's profile
    def gravatar_for_profile(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        return image_tag(user.avatar, class: "profile-avatar") if user.avatar.attached?
        image_tag(gravatar_url, alt: user.email, class: "profile-avatar")
    end

    # Return user's local storage image if they have previously uploaded an image
    def verification_pic(user)
        return image_tag(user.cardimage) if user.cardimage.attached?
    end

    # Return User's name if they have added it if not use the name in email before @
    def getUsername(user)
        user.username ? user.username.split(' ', 0)[0] : user.email.split('@', 0)[0]
    end
end
