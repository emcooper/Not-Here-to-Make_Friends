class TeamContestant < ApplicationRecord
  belongs_to :contestant
  belongs_to :team
end
