class Post < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    has_many :comments

    # Scope for finding posts between 2 dates.
    scope :created_between, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date ).order("created_at desc")}
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :content, presence: true
    validates :user_id, presence: true 
    validates :topic_id, presence: true 
    
    # Class method for search by keyword
    def self.searchByKeyword(keyword)
        Post.where("lower (posts.title) ILIKE :value OR 
                    lower (posts.content) ILIKE :value",
                    value: "%#{keyword.downcase}%")
    end

end
