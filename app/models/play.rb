class Play < ApplicationRecord
  enum season_type: [:bachelor, :bachelorette]
  enum play_type: [:show_milestones, :things_they_do, :things_they_say]

  def self.find_all(season_type, play_type)
    Play.where(season_type: season_type, play_type: play_type)
  end
end
