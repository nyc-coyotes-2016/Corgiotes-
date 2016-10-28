class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  has_many :guessed_cards, through: :guesses, source: :card
end
