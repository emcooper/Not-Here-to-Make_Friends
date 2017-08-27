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
    League.joins(:season, teams: :team_members)
          .where("team_members.user_id = ?", id)
          .where("seasons.status = ?", 0)
  end

  def leagues
    League.joins(teams: :team_members)
          .where("team_members.user_id = ?", id)
  end
end
