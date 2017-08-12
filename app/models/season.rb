class Season < ApplicationRecord
  belongs_to :season_type
  has_many :leagues
  has_many :weeks
  has_many :contestants

  enum role: %w(active retired)
end
