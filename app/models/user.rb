class User < ApplicationRecord
  # has_secure_password
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :comments
  has_many :identities

  # validates :password, :length => {:within => 8..20}

  # validates :email, :uniqueness => true,
  #                   :presence => true
  # validates :name, :presence => true

  enum role: %w(default admin)

  def self.create_with_omniauth(auth, identity)
    puts "creating new user #{auth[:info][:name]} (#{auth[:info][:email]}) with omniauth"
    user = User.create!(name: auth[:info][:name],
                      email: auth[:info][:email])
    puts "user #{auth[:info][:name]} (#{auth[:info][:email]}) created!" if user
    puts "user #{auth[:info][:name]} (#{auth[:info][:email]}) creation failed" unless user
    identity.update(user_id: user.id)
  end

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
