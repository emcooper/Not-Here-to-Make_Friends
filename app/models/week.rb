class Week < ApplicationRecord
  belongs_to :season
  has_many :actions
  has_many :weekly_contestants
  has_many :contestants, through: :weekly_contestants

  def self.current_week
    start_of_week = Date.today.beginning_of_week.to_date
    end_of_week = start_of_week + 7
    Week.where(date: start_of_week..end_of_week).first
  end
end
