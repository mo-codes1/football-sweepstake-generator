class Team < ApplicationRecord
  belongs_to :competition

  validates :name, presence: true
end
