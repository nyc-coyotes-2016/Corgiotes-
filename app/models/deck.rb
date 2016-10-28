class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
  # has_many :players, through: :rounds, source: :player  #FIX ME !!!!
  # belongs_to :creator, class: User
  validates :subject, presence: true

  def played_at
    self.rounds.map { |round| round.created_at.strftime('%B %d, %Y') }
  end

  def card_quantity
    self.cards.count
  end

  def first_guess_correct
    self.rounds.map { |round| round.guesses.}
  end

end
