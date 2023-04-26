class Topic < ApplicationRecord
    has_many :posts

    validates :name, uniqueness: { case_sensitive: false }

end
