require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = User.create(name: "User", email: "user@gmail.com", password: "password")

bachelor = SeasonType.create(name: "Bachelor")
nick_season = Season.create(first_name: "Nick", last_name: "Viall", season_number: 21, season_type: bachelor, status: "active")
league_1 = League.create(name: "League 1", season: nick_season)
league_2 = League.create(name: "League 2", season: nick_season)
team_1a = Team.create(name: "Team 1a", league: league_1)
team_2a = Team.create(name: "Team 2a", league: league_2)
user.teams << [team_1a, team_2a]
