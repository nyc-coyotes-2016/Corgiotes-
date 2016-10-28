class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :player, class_name: 'User'
  belongs_to :deck
  has_many :guessed_cards, through: :guesses, source: :card
end
