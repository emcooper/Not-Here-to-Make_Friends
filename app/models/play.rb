class Play < ApplicationRecord
  belongs_to :season_type

  enum season_type: [:bachelor, :bachelorette]
end
