class User < ActiveRecord::Base
  has_secure_password

  validates :username, :email, :password_digest, presence: true
  validates :email, :username, uniqueness: true
  validates_length_of :username, minimum: 6, maximum: 20
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  
  has_many :rounds
  has_many :guesses, through: :rounds, source: :guesses
  has_many :played_cards, through: :guesses, source: :card
  has_many :played_decks, through: :rounds, source: :deck
end
