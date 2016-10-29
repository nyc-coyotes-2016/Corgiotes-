class Round < ActiveRecord::Base
  validates :user_id, :deck_id, presence: true
  validate :validate_user_id, :validate_deck_id

  has_many :guesses
  belongs_to :player, class_name: 'User'
  belongs_to :deck
  has_many :guessed_cards, through: :guesses, source: :card

  def validate_user_id
    errors.add(:user_id, "does not exist") unless User.exists?(self.user_id)
  end

  def validate_deck_id
    errors.add(:deck_id, "does not exist") unless Deck.exists?(self.deck_id)
  end

  def first_guess
    first_cards_guess_correct = card_ids.select { |num| card_ids.count(num) == 1 }
    first_cards_guess_correct.length
  end

  def card_ids
    self.guesses.flatten.map { |guess| guess.card_id }
  end

  def played_at
    self.created_at.strftime('%B %d, %Y')
  end

  def total_guesses
    self.guesses.count
  end
end
