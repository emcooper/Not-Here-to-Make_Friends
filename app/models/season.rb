class Season < ApplicationRecord
  belongs_to :season_type
  has_many :leagues
  has_many :weeks
  has_many :contestants

  enum status: [:active, :retired]
  enum season_type: [:bachelor, :bachelorette]
end
