class Guess < ActiveRecord::Base

  belongs_to :card
  belongs_to :round
  has_many :players, through: :round, source: :user, class_name: :User

end
