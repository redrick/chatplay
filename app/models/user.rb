class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friends, through: :friendship
  has_many :friend_to, through: :friendship

  def friendship_with_current_user(user)
    Friendship.where(friend: self, friend_to: user).try(:first)
  end
end
