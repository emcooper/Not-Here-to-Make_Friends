class Contestant < ApplicationRecord
  validates_presence_of :name
  belongs_to :season
  has_many :team_contestants, dependent: :destroy
  has_many :teams, through: :team_contestants
  has_many :weekly_contestants, dependent: :destroy
  has_many :weeks, through: :weekly_contestants
  has_many :actions, dependent: :destroy
  has_many :plays, through: :actions
  has_many :draft_picks, dependent: :destroy
  has_many :contestant_qualities, dependent: :destroy
  has_many :qualities, through: :contestant_qualities

  after_create :analyze_personality

  def season_points
    actions.joins(:play).sum("point_value * count")
  end

  def weekly_points(week)
    actions.joins(:play)
            .where(week: week)
            .sum("point_value * count")
  end

  def weekly_actions(week)
    actions.where(week: week)
  end

  def all_weekly_points
    all_points = []
    10.times do |n|
      week = season.weeks.find_by(week_number: n+1)
      all_points << {week_number: n+1, points: (weekly_points(week) if week || 0)}
    end
    return all_points
  end

  def ranking
    sorted_contestants = (season.contestants.sort_by {|cont| cont.season_points}).reverse
    (sorted_contestants.index(self) + 1).ordinalize
  end

  def biggest_play
    plays.order("point_value DESC").first
  end

  def average_draft_rank
    draft_picks.average(:rank).round.ordinalize
  end

  def add_empty_actions
    season.weeks.each do |week|
      Action.create(week: week, contestant: self, play: Play.first, count: 0)
    end
  end

  def analyze_personality
    if ENV["RAILS_ENV"] == "production"
      WatsonService.new(self.bio, self).save_qualities
    else
      Quality.all.each do |quality|
        ContestantQuality.create(percentage: rand(0..100),
                                 quality: quality,
                                 contestant: self)
      end
    end
  end

  def eliminated?
    latest_entered_week = season.weeks.joins(:contestants).order('week_number').last
    latest_entered_week && !latest_entered_week.contestants.include?(self)
  end
end
