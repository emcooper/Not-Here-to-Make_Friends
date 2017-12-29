class Season < ApplicationRecord
  has_many :leagues, dependent: :destroy
  has_many :weeks, dependent: :destroy
  has_many :contestants, dependent: :destroy

  enum status: [:active, :retired]
  enum season_type: [:bachelor, :bachelorette]

  def mvp
    mvp = (contestants.sort_by {|cont| cont.season_points}).reverse.first
    (mvp if mvp.season_points > 0) || nil
  end

  def contestant_with_biggest_play
    contestants.joins(actions: :play).order("point_value DESC").first
  end


end
