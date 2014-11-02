class Friendship < ActiveRecord::Base
  belongs_to :friend, class_name: 'User'
  belongs_to :friend_to, class_name: 'User'

  has_many :messages
end
