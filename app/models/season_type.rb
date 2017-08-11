class SeasonType < ApplicationRecord
  has_many :seasons
  has_many :plays
end
