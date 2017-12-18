class Play < ApplicationRecord
  enum season_type: [:bachelor, :bachelorette]
  enum play_type: [:show_milestones, :things_they_do, :things_they_say]
end
