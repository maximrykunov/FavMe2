class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # ----------------------------------------------------------------------------
  # Relations.
  # ----------------------------------------------------------------------------

  has_many :contacts, dependent: :destroy, inverse_of: :owner, foreign_key: 'owner_id'
  has_many :participants, dependent: :nullify, inverse_of: :user

  has_many :meetings, inverse_of: :user

  has_many :activities, inverse_of: :user
  has_many :events

  # frindship section
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user

end
