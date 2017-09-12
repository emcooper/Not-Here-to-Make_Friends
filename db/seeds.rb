require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

plays = {"Rose Ceremony Rose" => 10,
"Group Date Rose" => 20,
"First Impression Rose" => 30,
"One-on-One Rose" => 20,
"Sent Home on One-on-One" => 30,
"Two-on-One Rose" => 30,
"Sent Home on Two-on-One" => 20,
"Quits the Show" => 50,
"Attempts to Return to Show After Being Eliminated" => 30,
"'Steals' Rachel away (MUST SAY 'STEAL')" => 10,
"'Fairytale'" => 10,
"'For the right reasons'" => 10,
"'Journey'" => 10,
"'I’m not here to make friends'" => 10,
"'Luckiest girl in the world'" =>  10,
"First to tell Rachel she is falling in love" => 20,
"Tells Rachel she is falling in Love (not first)" => 10,
"Reveals tragic backstory" => 15,
"Wins non-rose competition on a group date" => 10,
"Full Nudity" => 25,
"Requires medical attention" => 25,
"References parents’ relationship as inspiration" => 10,
"Helicopter Ride" => 10,
"Treated to a private concert" => 10,
"Discusses another Contestant with Bachelor" => 10,
"Calls someone 'old'" => 10,
"Drunk at a rose ceremony" => 10,
"Says set location is 'the perfect place to fall in love'" =>  10,
"Makes Rachel Cry" => 30,
"Cries" => 5,
"Makes another Contestant Cry" => 20,
"Wins" => 50}

plays.each do |description, points|
  Play.create!(description: description, point_value: points, season_type: "bachelorette")
end



ellen = User.create(name: "User", email: "ellen@gmail.com", password: "password")
hayley = User.create(name: "Hayley", email: "hayley@gmail.com", password: "password")
diana = User.create(name: "Diana", email: "diana@gmail.com", password: "password")
new_user = User.create(name: "New User", email: "new_user@gmail.com", password: "password")


rachel_season = Season.create(first_name: "Rachel", last_name: "Lindsay", headshot: "http://img.etonline.com/1242911076001/201705/288/1242911076001_5434770022001_et-051417-RachelLindsayOutfitshu.jpg?pubId=1242911076001", season_number: 13, season_type: "bachelorette", status: "active")
nick_season = Season.create(first_name: "Nick", last_name: "Vial", headshot: "https://img.buzzfeed.com/buzzfeed-static/static/2017-04/25/15/campaign_images/buzzfeed-prod-fastlane-03/nick-viall-reveals-why-he-kept-that-yellow-bracel-2-9069-1493149672-2_dblbig.jpg", season_number: 21, season_type: "bachelor", status: "retired")
league_1 = League.create(name: "League 1", season: rachel_season)
league_2 = League.create(name: "League 2", season: rachel_season)
team_1a = Team.create(name: "Team 1a", league: league_1)
team_1b = Team.create(name: "Team 1b", league: league_1)
team_2a = Team.create(name: "Team 2a", league: league_2)
ellen.teams << [team_1a, team_2a]
hayley.teams << [team_1a, team_2a]
diana.teams << [team_1b, team_2a]

date = Date.new(2017, 8 , 28)
12.times do |n|
  Week.create(date: date, week_number: n, season: rachel_season)
  date += 7
end

contestant_names = ["Bryan", "Peter", "Eric", "Dean", "Adam", "Matt", "Alex", "Will", "Kenny", "Josiah", "Anthony", "Lee",
"Jonathan", "Iggy", "Jack", "Diggy", "Bryce", "Brady", "Fred", "Lucas", "Jamey", "Blake", "DeMario",
"Rob", "Mohit", "Milton", "Michael", "Kyle", "Jedidiah", "Grant", "Blake"]

contestant_names.each_with_index do |name, n|
  dude = Contestant.create(name: name, headshot: Faker::Avatar.image, bio: Faker::MostInterestingManInTheWorld.quote, season: rachel_season, age: rand(25..40), hometown: "#{Faker::Address.city}, #{Faker::Address.state_abbr}", occupation: Faker::Company.profession, twitter_handle: "@TheAbDoctor")
  if n < 2
    dude.weeks << Week.all
  elsif n < 5
    dude.weeks << Week.all[0..10]
  else
    dude.weeks << Week.all[0..7]
  end
end

Week.all.each do |week|
  week.contestants.each do |cont|
    Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: rand(3) + 1)
    Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: rand(3) + 1)
    Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: rand(3) + 1)
    Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: rand(3) + 1)
    Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: rand(3) + 1)
  end
end

team_1a.contestants << Contestant.all[0..10]
team_1b.contestants << Contestant.all[11..20]
team_2a.contestants << Contestant.all[2..13]

puts("SUCCESSFUL SEEDING!")
