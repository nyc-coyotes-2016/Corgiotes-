class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
  # has_many :players, through: :rounds, source: :player  #FIX ME !!!!
  # belongs_to :creator, class: User
  validates :subject, presence: true
end
