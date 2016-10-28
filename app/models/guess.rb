class Guess < ActiveRecord::Base

  belongs_to :card
  belongs_to :round
  has_many :players, through: :round, source: :user, class_name: :User


  validates_presence_of :card_id, :round_id
  validate :validate_card_id, :validate_round_id

  def validate_card_id
    errors.add(:card_id, "does not exist") unless Card.exists?(self.card_id)
  end

  def validate_round_id
    errors.add(:round_id, "does not exist") unless Round.exists?(self.round_id)
  end
end
