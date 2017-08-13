class User < ApplicationRecord
  has_secure_password
  has_many :team_members
  has_many :teams, through: :team_members
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 8..20}
  validates :email, :uniqueness => true,
                    :presence => true
  validates :name, :presence => true

  enum role: %w(default admin)

  def active_leagues
    self.leagues.select {|league| league.season.active?}
  end

  def leagues
    league_ids = self.teams.pluck(:league_id)
    League.where(id: league_ids)
  end
end
