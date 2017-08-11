class WeeklyContestant < ApplicationRecord
  belongs_to :contestant
  belongs_to :week
end
