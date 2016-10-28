class Round < ActiveRecord::Base

  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :card

  belongs_to :player, class_name: 'User'
  belongs_to :deck

end
