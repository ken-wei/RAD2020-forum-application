class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    # User's avatar image
    has_one_attached :avatar
    # User's verification card image
    has_one_attached :cardimage

    attr_accessor :remember_token, :reset_token
    before_save :downcase_email
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    # Mobile with 10 to 13 digits only
    VALID_MOBILE_REGEX = /\A\d{10,13}$\z/
    # Password length between 8 - 20 excluding special characters
    VALID_PASSWORD_REGEX = /\A[\d\w]{8,20}\z/

    validates :password, presence: true, 
                         length: { minimum: 8, maximum: 20 }, 
                         format: { with: VALID_PASSWORD_REGEX }, 
                         allow_nil: true
    validates :email, presence: true, length: { maximum: 255 }, 
                                      format: { with: VALID_EMAIL_REGEX },
                                      uniqueness: { case_sensitive: false }                              
    validates :mobile, presence: true, length: { minimum: 10, maximum: 13 },
                                       format: { with: VALID_MOBILE_REGEX }

    validate :image_size
    validate :cardimage_size

    has_secure_password


    # Return hash digest of any given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Verify avatar image size
    def image_size
        if avatar.attached?
            if avatar.blob.byte_size > 2000000
                avatar.purge
                errors.add :avatar, 'Avatar Image size too large' 
            elsif !avatar.blob.content_type.starts_with?('image/')
                avatar.purge
                errors.add :avatar, 'Wrong format for avatar image, only image format is allowed!'
            end
        end 
    end

    # Verify verfication card image size
    def cardimage_size
        if cardimage.attached?
            if cardimage.blob.byte_size > 2000000
                cardimage.purge
                errors.add :cardimage, 'Card Image size too large' 
            elsif !cardimage.blob.content_type.starts_with?('image/')
                cardimage.purge
                errors.add :cardimage, 'Wrong format for card image, only image format is allowed!'
            end
        end 
    end

    # Returns a random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns the hash digest of the given string
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns true if the given token matches the digest
    def authenticated?(attribute, token)
        digest = self.send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    # Forgets a user
    def forget
        update_attribute(:remember_digest, nil)
    end

    # Sets the password reset attribute
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    # Sends password reset email.
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # Returns true if a password reset has expired
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    private 
        
        # Converts email to all lower-case
        def downcase_email
            self.email = email.downcase
        end

end
