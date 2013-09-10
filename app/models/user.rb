class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  store_accessor :properties,
    :receive_messages,
    :receive_invites,
    :receive_notifications,
    :show_email


  # ----------------------------------------------------------------------------
  # Relations.
  # ----------------------------------------------------------------------------

  has_many :contacts, dependent: :destroy, inverse_of: :owner, foreign_key: 'owner_id'
  has_many :participants, dependent: :nullify, inverse_of: :user

  has_many :meetings, inverse_of: :user

  has_many :activities, inverse_of: :user
  has_many :events

end
