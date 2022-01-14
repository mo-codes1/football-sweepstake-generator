class Game < ApplicationRecord
  belongs_to :competition
  has_many :players

  validates :name, presence: true
end
