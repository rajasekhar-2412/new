class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.friend(user,friend)
    where("((user_id=? and friend_id =?) or (user_id=? and friend_id =?)) and is_accept=?",user,friend,friend,user,'true').first
  end
end
