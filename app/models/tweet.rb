class Tweet < ApplicationRecord
    validates :contents, presence: true
    validates :user_id, presence: true

    belongs_to :user
    has_many :likes

    has_many :tweets
end
