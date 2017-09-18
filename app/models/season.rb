class Season < ApplicationRecord
  has_many :leagues
  has_many :weeks
  has_many :contestants

  enum status: [:active, :retired]
  enum season_type: [:bachelor, :bachelorette]

  def mvp
    (contestants.sort_by {|cont| cont.season_points}).reverse.first
  end
end
