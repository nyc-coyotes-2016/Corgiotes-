class User < ActiveRecord::Base
  has_secure_password
  has_many :rounds
  has_many :guesses, through: :rounds, source: :guesses
  has_many :played_cards, through: :guesses, source: :card
  has_many :played_decks, through: :rounds, source: :deck
end
