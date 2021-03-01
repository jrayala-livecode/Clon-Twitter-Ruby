class Tweet < ApplicationRecord
    validates :contents, presence: true
    validates :user_id, presence: true

    belongs_to :user
    has_many :likes
    has_many :tweets    

    def self.current
        Thread.current[:current_user]
    end

    def self.tweets_for_me(current_user)
        joins("INNER JOIN friends ON friends.friend_id = tweets.user_id").where("friends.user_id = #{current_user}").distinct
    end

end
