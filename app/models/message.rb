class Message < ActiveRecord::Base
  belongs_to :friendship
  belongs_to :user
end
