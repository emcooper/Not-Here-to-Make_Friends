class User < ApplicationRecord
  has_secure_password
  has_many :team_members
  has_many :teams, through: :team_members

  enum role: %w(default admin)
end
