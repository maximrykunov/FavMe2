class Friendship < ActiveRecord::Base

  validates_presence_of :user_id, :friend_id

  # scope :ordered, -> { order { users.email } }

  # ----------------------------------------------------------------------------
  # Relations.
  # ----------------------------------------------------------------------------
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  # ----------------------------------------------------------------------------
  # Class methods.
  # ----------------------------------------------------------------------------

  def self.by_state(state)
    where(state: state)
  end

  def self.for_user(user_id)
    where("user_id = :user_id OR friend_id = :user_id", user_id: user_id)
  end

  # def self.between_users(user_id, friend_id)
  #   where("(user_id = :user_id AND friend_id = :friend_id) OR (user_id = :friend_id AND friend_id = :user_id)", user_id: user_id, friend_id: friend_id)
  # end

  def self.between_users(user_id, friend_id)
    where("user_id = :user_id AND friend_id = :friend_id", user_id: user_id, friend_id: friend_id)
  end

  def self.accept(user_id, friend_id)
    transaction do
      between_users(user_id, friend_id).first.update({ message: nil, state: 'active'})
      between_users(friend_id, user_id).first.update({ message: nil, state: 'active'})
      return true
    end
    return false
  end

  # ----------------------------------------------------------------------------
  # Instance methods.
  # ----------------------------------------------------------------------------
  def friend_user(user)
    user_id == user.id ? friend : self.user
  end

end
