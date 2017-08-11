class Week < ApplicationRecord
  belongs_to :season
  has_many :actions
  has_many :weekly_contestants
  has_many :contestants, through: :weekly_contestants
end
