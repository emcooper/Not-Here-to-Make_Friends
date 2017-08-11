class User < ApplicationRecord
  has_many :team_members
  has_many :teams, through: :team_members
end
