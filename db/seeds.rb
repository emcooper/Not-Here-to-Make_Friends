require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# bachelor_plays = {"Rose Ceremony Rose" => 10,
# "Group Date Rose" => 20,
# "First Impression Rose" => 30,
# "One-on-One Rose" => 20,
# "Sent Home on One-on-One" => 35,
# "Two-on-One Rose" => 25,
# "Sent Home on Two-on-One" => 20,
# "Quits the Show" => 50,
# "Attempts to Return to Show After Being Eliminated" => 45,
# "'Steals' Rachel away (MUST SAY 'STEAL')" => 10,
# "'Fairytale'" => 10,
# "'For the right reasons'" => 10,
# "'Journey'" => 10,
# "'I’m not here to make friends'" => 10,
# "'Luckiest girl in the world'" =>  10,
# "First to tell Rachel she is falling in love" => 20,
# "Tells Rachel she is falling in Love (not first)" => 10,
# "Reveals tragic backstory" => 15,
# "Wins non-rose competition on a group date" => 10,
# "Full Nudity" => 20,
# "Requires medical attention" => 25,
# "References parents’ relationship as inspiration" => 10,
# "Helicopter Ride" => 10,
# "Treated to a private concert" => 10,
# "Discusses another Contestant with Bachelor" => 10,
# "Calls someone 'old'" => 10,
# "Drunk at a rose ceremony" => 10,
# "Says set location is 'the perfect place to fall in love'" =>  10,
# "Makes Rachel Cry" => 30,
# "Cries" => 5,
# "Makes another Contestant Cry" => 20,
# "Wins" => 50}

bachelorette_plays = {"Rose Ceremony Rose" => 10,
"Group Date Rose" => 20,
"First Impression Rose" => 30,
"One-on-One Rose" => 20,
"Sent Home on One-on-One" => 35,
"Two-on-One Rose" => 25,
"Sent Home on Two-on-One" => 10,
"Quits the Show" => 60,
"Attempts to Return to Show After Being Eliminated" => 45,
"'Steals' Rachel away (MUST SAY 'STEAL')" => 10,
"Says 'Fairytale'" => 10,
"Says 'For the right reasons'" => 10,
"Says 'Journey'" => 10,
"Says 'I’m not here to make friends'" => 40,
"Says they've 'never felt this way before'" => 10,
"Tells Rachel he is falling in love (first)" => 20,
"Tells Rachel he is falling in love (not first)" => 10,
"Reveals tragic backstory" => 15,
"Full Nudity" => 20,
"Requires medical attention" => 35,
"References parents’ relationship as inspiration" => 10,
"Helicopter Ride" => 10,
"Treated to a private concert" => 10,
"Drunk at a rose ceremony" => 20,
"Says set location is 'the perfect place to fall in love'" =>  10,
"Cries" => 10,
"Makes another Contestant Cry" => 20,
"Involved in Physical Altercation" => 20,
"Wins" => 50}

bachelorette_plays.each do |description, points|
  Play.create!(description: description.titleize, point_value: points, season_type: "bachelorette")
end

ellen = User.create(name: "Ellen", email: "ellen@gmail.com", password: "password", role: 1)
player_2 = User.create(name: Faker::Friends.character, email: "user_2@gmail.com", password: "password")
player_3 = User.create(name: Faker::Friends.character, email: "user_3@gmail.com", password: "password")
player_4 = User.create(name: Faker::Friends.character, email: "user_4@gmail.com", password: "password")
player_5 = User.create(name: Faker::Friends.character, email: "user_5@gmail.com", password: "password")
new_user = User.create(name: "New User", email: "new_user@gmail.com", password: "password")


qualities = ["Adventurousness", "Imagination", "Intellect", "Authority-challenging",
  "Self-discipline", "Assertiveness", "Cheerfulness", "Outgoing", "Modesty",
  "Morality", "Anger", "Anxiety"]

qualities.each do |quality_name|
  Quality.create(name: quality_name)
end


rachel_season = Season.create(first_name: "Rachel", last_name: "Lindsay", headshot: "http://img.etonline.com/1242911076001/201705/288/1242911076001_5434770022001_et-051417-RachelLindsayOutfitshu.jpg?pubId=1242911076001", season_number: 13, season_type: "bachelorette", status: "active", draft_date: "2017-10-1")
nick_season = Season.create(first_name: "Nick", last_name: "Vial", headshot: "https://img.buzzfeed.com/buzzfeed-static/static/2017-04/25/15/campaign_images/buzzfeed-prod-fastlane-03/nick-viall-reveals-why-he-kept-that-yellow-bracel-2-9069-1493149672-2_dblbig.jpg", season_number: 21, season_type: "bachelor", status: "retired", draft_date: "2017-10-1")
league_1 = League.create(name: "The Final Rose", season: rachel_season)
league_2 = League.create(name: "All the Roses", season: rachel_season)


date = Date.new(2017, 8 , 15)
12.times do |n|
  Week.create(date: date, week_number: n, season: rachel_season)
  date += 7
end

contestant_info = [{name: "Bryan", twitter_handle: "@TheAbDoctor", headshot: "http://img.usmagazine.com/480-width/bryan-zoom-5d94994e-9cf5-454f-af90-f2c663d96be2.jpg"},
                    {name: "Peter", twitter_handle: "@PeterWIKraus", headshot: "http://img.usmagazine.com/1200-width/peter-zoom-e4e8df12-62c5-4d24-8dce-f2b2371c262d.jpg"},
                    {name: "Eric", twitter_handle: "@Eric_Bigger", headshot: "http://img.usmagazine.com/1200-width/eric-zoom-8791f180-30a3-4bb7-86bd-a1e8eec6e570.jpg"},
                    {name: "Dean", twitter_handle: "@deanie_babies", headshot: "http://img.usmagazine.com/480-width/dean-zoom-ddb8ae82-cfe7-4110-84ad-07288bc27117.jpg"},
                    {name: "Adam", twitter_handle: "@AdamJGottschalk", headshot: "http://img.usmagazine.com/480-width/adam-zoom-414f4989-2604-4531-bd02-9b49c925ba33.jpg"},
                    {name: "Matt", twitter_handle: "@RealMattMunson", headshot: "http://img.usmagazine.com/1200-width/matthew-zoom-173d1a39-e2c8-4a6f-91ba-52b25bf0e92f.jpg"},
                    {name: "Alex", twitter_handle: "@Alex_Bordy", headshot: "http://img.usmagazine.com/480-width/alex-zoom-b97a783a-1746-47a5-afb4-21e392f64858.jpg"},
                    {name: "Will", twitter_handle: "@cwonder88", headshot: "http://img.usmagazine.com/1200-width/will-zoom-7e522621-f92e-435c-99b0-b83df63fa367.jpg"},
                    {name: "Kenny", twitter_handle: "@KennyKingPB2", headshot: "http://img.usmagazine.com/1200-width/kenny-zoom-1bd92965-dff2-4ffb-b637-e3bf56847355.jpg"},
                    {name: "Josiah", twitter_handle: "@JosiahDGraham", headshot: "http://img.usmagazine.com/1200-width/josiah-zoom-b72aebbe-4c0a-48a2-929d-b501c0f91478.jpg"},
                    {name: "Lee", twitter_handle: "@leegarrett_", headshot: "http://img.usmagazine.com/1200-width/lee-zoom-bf44e723-d545-4828-98ff-2e544b70c2b5.jpg"},
                    {name: "Jonathan", twitter_handle: "@drticklemonster", headshot: "http://img.usmagazine.com/1200-width/jonathan-zoom-97012b6c-248d-4e7b-9602-a153d0eb7184.jpg"},
                    {name: "Iggy", twitter_handle: "@Iggy_Rodriguez", headshot: "http://img.usmagazine.com/1200-width/iggy-zoom-d8eb3bd5-1163-4af3-9274-1ae4602b7071.jpg"},
                    {name: "Jack", twitter_handle: "@JackJ_Stone", headshot: "http://img.usmagazine.com/1200-width/jack-zoom-8d0aa91c-b7ae-4abe-841b-602bc057df53.jpg"},
                    {name: "Diggy", twitter_handle: "@diggymoreland", headshot: "http://img.usmagazine.com/1200-width/kenneth-zoom-2bd13d2a-fcd3-4e7c-a87e-08eaa6675631.jpg"},
                    {name: "Bryce", twitter_handle: "@bdpowers5", headshot: "http://img.usmagazine.com/480-width/bryce-zoom-b258a7bb-a5e2-4578-b982-ed6ce3fd8567.jpg"},
                    {name: "Brady", twitter_handle: "@ervgoddi", headshot: "http://img.usmagazine.com/480-width/brady-zoom-4a54a68d-b795-4ff6-8d97-64d998348389.jpg"},
                    {name: "Fred", twitter_handle: "@RealFredJohnson", headshot: "http://img.usmagazine.com/1200-width/fred-zoom-1b0dfe41-11a6-45cd-af9d-d3071eb926ec.jpg"},
                    {name: "Lucas", twitter_handle: "@LucasYancey", headshot: "http://img.usmagazine.com/1200-width/lucas-zoom-42bf0c7c-0e95-41d2-a987-dc732dfe21d2.jpg"},
                    {name: "Jamey", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/jamey-zoom-a3fd0cc7-163b-4038-ac11-1ea5a17828d6.jpg"},
                    {name: "Blake E.", twitter_handle: "@BlakeLosAngeles", headshot: "http://img.usmagazine.com/480-width/blake-e-zoom-d8e74e2e-6467-4ae3-82a0-4fc387c991d8.jpg"},
                    {name: "DeMario", twitter_handle: "@demariojackson_", headshot: "http://img.usmagazine.com/1200-width/demario-zoom-a213fcd8-4063-4955-99d7-0dd19c2bf0eb.jpg"},
                    {name: "Rob", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/robert-zoom-d077e135-3d77-4797-8b9a-99a492066d83.jpg"},
                    {name: "Mohit", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/mohit-zoom-9e790a9c-769f-4c7a-a9fd-ee486a280b30.jpg"},
                    {name: "Milton", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/milton-zoom-c671684f-ec88-4aea-8318-2ec8b306f5da.jpg"},
                    {name: "Michael", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/michael-zoom-7a18f0c6-97b0-43b6-8c7d-bb5db1b86db8.jpg"},
                    {name: "Kyle", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/kyle-zoom-abac3eb8-f670-4f7a-86ad-b7f5a88bd27c.jpg"},
                    {name: "Jedidiah", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/660-width/jedidiah-zoom-f2f040d5-e0bb-43fa-8796-3723c0f013bc.jpg"},
                    {name: "Grant", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/1200-width/grant-zoom-d15d5d2a-6ef8-42d6-ba1c-96ade10689fe.jpg"},
                    {name: "Blake K.", twitter_handle: "@DarthVader", headshot: "http://img.usmagazine.com/480-width/blake-k-zoom-b8285bd0-5622-4b36-a98a-aa855c474c6b.jpg"}]

contestant_info.each_with_index do |info, n|
  dude = Contestant.create(info.merge({bio: Faker::MostInterestingManInTheWorld.quote,
                                        season: rachel_season,
                                        age: rand(25..40),
                                        hometown: "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                                        occupation: Faker::Company.profession.titleize}))
  if n < 3
    dude.weeks << Week.all
  elsif n < 5
    dude.weeks << Week.all[0..10]
  elsif n < 10
    dude.weeks << Week.all[0..8]
  else
    dude.weeks << Week.all[0..5]
  end
end

Week.all.each_with_index do |week, index|
  week.contestants.each do |cont|
    unless (cont.name == "Dean" && index == 7)
      Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: [1,1,1,2].sample)
      Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: [1,1,1,2].sample)
      Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: [1,1,1,2].sample)
      Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: [1,1,1,2].sample)
      Action.create(week: week, contestant: cont, play: Play.all[rand(100)], count: [1,1,1,2].sample)
    end
  end
end
## Dean's Actions
Action.create(week: Week.all[7], contestant: Contestant.find_by(name: "Dean"), play: Play.find_by(description: "Drunk At A Rose Ceremony"), count: 1)
Action.create(week: Week.all[7], contestant: Contestant.find_by(name: "Dean"), play: Play.find_by(description: "Says They've 'Never Felt This Way Before'"), count: 1)
Action.create(week: Week.all[7], contestant: Contestant.find_by(name: "Dean"), play: Play.find_by(description: "Cries"), count: 2)


team_1a = Team.create(name: "Here for the Wrong Reasons", league: league_1)
team_1b = Team.create(name: "Chris Harrison", league: league_1)
team_1c = Team.create(name: "Here for the Right Reasons", league: league_1)

team_2a = Team.create(name: "Corrine's Naps", league: league_2)
team_2b = Team.create(name: "Bryan's Cheek Implants", league: league_2)
team_2c = Team.create(name: "Taylor's Emotional Intelligence", league: league_2)

ellen.teams << [team_1a, team_2b]
player_2.teams << [team_1a, team_2b]
player_3.teams << [team_1c, team_2c]
player_4.teams << [team_1b, team_2a]
player_5.teams << [team_1b, team_2c]


puts("SUCCESSFUL SEEDING!")
