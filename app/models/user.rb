class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :likes
  has_one_attached :avatar
  has_many :friends

  def has_friend(user_id)
    if Friend.find_by(friend_id: self.id, user_id: user_id)
      true
    else
      false
    end
  end

end
