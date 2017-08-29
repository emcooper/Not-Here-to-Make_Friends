require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

ellen = User.create(name: "User", email: "ellen@gmail.com", password: "password")
hayley = User.create(name: "Hayley", email: "hayley@gmail.com", password: "password")
diana = User.create(name: "Diana", email: "diana@gmail.com", password: "password")
new_user = User.create(name: "New User", email: "new_user@gmail.com", password: "password")


rachel_season = Season.create(first_name: "Rachel", last_name: "Lindsay", season_number: 13, season_type: "bachelorette", status: "active")
nick_season = Season.create(first_name: "Nick", last_name: "Vial", season_number: 21, season_type: "bachelor", status: "retired")
league_1 = League.create(name: "League 1", season: rachel_season)
league_2 = League.create(name: "League 2", season: rachel_season)
team_1a = Team.create(name: "Team 1a", league: league_1)
team_1b = Team.create(name: "Team 1b", league: league_1)
team_2a = Team.create(name: "Team 2a", league: league_2)
ellen.teams << [team_1a, team_2a]
hayley.teams << [team_1a, team_2a]
diana.teams << [team_1b, team_2a]

contestant_names = ["Bryan", "Peter", "Eric", "Dean", "Adam", "Matt", "Alex", "Will", "Kenny", "Josiah", "Anthony", "Lee",
"Jonathan", "Iggy", "Jack", "Diggy", "Bryce", "Brady", "Fred", "Lucas", "Jamey", "Blake", "DeMario",
"Rob", "Mohit", "Milton", "Michael", "Kyle", "Jedidiah", "Grant", "Blake"]

contestant_names.each do |name|
  Contestant.create(name: name, headshot: Faker::Avatar.image, bio: Faker::MostInterestingManInTheWorld.quote, season: rachel_season)
end

team_1a.contestants << Contestant.all[0..10]
team_1b.contestants << Contestant.all[11..20]
team_2a.contestants << Contestant.all[2..13]

date = Date.new(2017, 8 , 28)

12.times do |n|
  Week.create(date: date, week_number: n, season: rachel_season)
  date += 7
end
