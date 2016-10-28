class Deck < ActiveRecord::Base

  has_many :rounds
  has_many :cards
  # has_many :players, through: rounds, source: user

  validates :subject, presence: true

end
