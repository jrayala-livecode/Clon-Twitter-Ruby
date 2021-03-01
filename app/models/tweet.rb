class Tweet < ApplicationRecord
    validates :contents, presence: true
    validates :user_id, presence: true

    belongs_to :user
    has_many :likes
    has_many :tweets    
    
    serialize :hashtags, Array

    def self.current
        Thread.current[:current_user]
    end

    def self.tweets_for_me(current_user)
        joins("INNER JOIN friends ON friends.friend_id = tweets.user_id").where("friends.user_id = #{current_user}").distinct
    end

    before_save do
        self.hashtags = self.contents.scan(/#\w+/).flatten
    end
    
end
