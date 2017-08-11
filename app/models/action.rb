class Action < ApplicationRecord
  belongs_to :contestant
  belongs_to :play
  belongs_to :week
end
