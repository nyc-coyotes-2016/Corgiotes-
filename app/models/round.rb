class Round < ActiveRecord::Base

  validates :user_id, :deck_id, presence: true
  validate :validate_user_id, :validate_deck_id


  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :card

  belongs_to :player, class_name: 'User'
  belongs_to :deck

  has_many :guessed_cards, through: :guesses, source: :card

  def validate_user_id
    errors.add(:user_id, "does not exist") unless User.exists?(self.user_id)
  end

  def validate_deck_id
    errors.add(:deck_id, "does not exist") unless Deck.exists?(self.deck_id)
  end

end
