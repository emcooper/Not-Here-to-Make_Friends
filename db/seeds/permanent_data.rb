# creates plays and qualities that will exist as permanent unchanging data

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean


bachelor_plays = {
  "show_milestones" => {"Rose Ceremony Rose" => 10,
                    "Group Date Rose" => 20,
                    "First Impression Rose" => 30,
                    "One-on-One Rose" => 20,
                    "Sent Home on One-on-One" => 35,
                    "Two-on-One Rose" => 25,
                    "Sent Home on Two-on-One" => 10,
                    "Quits the Show" => 60,
                    "Wins" => 50,
                    "Attempts to Return to Show After Being Eliminated" => 45},

  "things_they_do" => {"Cries" => 10,
                    "Makes another Contestant Cry" => 20,
                    "Makes Bachelor Cry" => 30,
                    "Reveals tragic backstory" => 15,
                    "Requires medical attention" => 35,
                    "Helicopter Ride" => 10,
                    "Treated to a private concert" => 10,
                    "Drunk at a rose ceremony" => 20,
                    "Involved in Physical Altercation" => 20,
                    "Full Nudity" => 20,
                    "Caught Kissing on Group Date" => 10,
                    "First to Kiss Bachelor" => 20
                  },

  "things_they_say" => {"Says 'I’m not here to make friends'" => 40,
                    "Says they've 'never felt this way before'" => 10,
                    "'Steals' Bachelor away (MUST SAY 'STEAL')" => 10,
                    "Says 'Fairytale'" => 10,
                    "Says 'For the right reasons'" => 10,
                    "Says 'Journey'" => 10,
                    "'Luckiest girl in the world'" =>  10,
                    "References parents’ relationship as inspiration" => 10,
                    "Says this is 'the perfect place to fall in love'" =>  10,
                    "Tells Bachelor she is falling in love (first)" => 20,
                    "Tells Bachelor she is falling in love (not first)" => 10}
  }

  bachelorette_plays = {
    "show_milestones" => {"Rose Ceremony Rose" => 10,
                      "Group Date Rose" => 20,
                      "First Impression Rose" => 30,
                      "One-on-One Rose" => 20,
                      "Sent Home on One-on-One" => 35,
                      "Two-on-One Rose" => 25,
                      "Sent Home on Two-on-One" => 10,
                      "Quits the Show" => 60,
                      "Wins" => 50,
                      "Attempts to Return to Show After Being Eliminated" => 45},

    "things_they_do" => {"Cries" => 10,
                      "Makes another Contestant Cry" => 20,
                      "Reveals tragic backstory" => 15,
                      "Requires medical attention" => 35,
                      "Helicopter Ride" => 10,
                      "Treated to a private concert" => 10,
                      "Drunk at a rose ceremony" => 20,
                      "Involved in Physical Altercation" => 20,
                      "Full Nudity" => 20,
                      "Caught Kissing on Group Date" => 10,
                      "First to Kiss Bachelorette" => 20
                    },

    "things_they_say" => {"Says 'I’m not here to make friends'" => 40,
                      "Says they've 'never felt this way before'" => 10,
                      "'Steals' Bachelorette away (MUST SAY 'STEAL')" => 10,
                      "Says 'Fairytale'" => 10,
                      "Says 'For the right reasons'" => 10,
                      "Says 'Journey'" => 10,
                      "References parents’ relationship as inspiration" => 10,
                      "Says this is 'the perfect place to fall in love'" =>  10,
                      "Tells Bachelorette he is falling in love (first)" => 20,
                      "Tells Bachelorette he is falling in love (not first)" => 10}
    }

qualities = ["Adventurousness", "Imagination", "Intellect", "Authority-challenging",
  "Self-discipline", "Assertiveness", "Cheerfulness", "Outgoing", "Modesty",
  "Morality", "Anger", "Anxiety"]

def seed_bachelor_plays(plays)
  plays.each do |play_type, plays|
    plays.each do |description, points|
      Play.create!(description: description.titleize, point_value: points, season_type: "bachelor", play_type: play_type)
    end
  end
end

def seed_bachelorette_plays(plays)
  plays.each do |play_type, plays|
    plays.each do |description, points|
      Play.create!(description: description.titleize, point_value: points, season_type: "bachelorette", play_type: play_type)
    end
  end
end

def seed_qualities(qualities)
  qualities.each do |quality_name|
    Quality.create(name: quality_name)
  end
end

seed_bachelor_plays(bachelor_plays)
seed_bachelorette_plays(bachelorette_plays)
seed_qualities(qualities)
