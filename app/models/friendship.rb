class Friendship < ActiveRecord::Base

  validates_presence_of :user_id, :friend_id

  # scope :by_user, order { users.email }
  scope :ordered, order { users.email }

  # ----------------------------------------------------------------------------
  # Relations.
  # ----------------------------------------------------------------------------
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  # ----------------------------------------------------------------------------
  # Class methods.
  # ----------------------------------------------------------------------------

  def self.by_state(state)
    scoped.where(state: state)
  end

  def self.for_user(user_id)
    scoped.where("user_id = :user_id OR friend_id = :user_id", user_id: user_id)
  end

  def self.between_users(user_id, friend_id)
    scoped.where("(user_id = :user_id AND friend_id = :friend_id) OR (user_id = :friend_id AND friend_id = :user_id)", user_id: user_id, friend_id: friend_id)
  end

  # ----------------------------------------------------------------------------
  # Instance methods.
  # ----------------------------------------------------------------------------
  def friend_user(user)
    user_id == user.id ? friend : self.user
  end

end
