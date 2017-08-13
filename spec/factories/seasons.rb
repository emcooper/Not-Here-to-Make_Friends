FactoryGirl.define do
  factory :season do
    sequence :first_name {|n| "first_name #{n}"}
    sequence :last_name {|n| "last_name #{n}"}
    sequence :season_number {|n| n}
    season_type
    status 0
  end


  trait :active_with_existing_users do
    after(:create) do |season|
      user_1 = User.first
      user_2 = User.second
      league_1 = create(:league, season: season)
      league_2 = create(:league, season: season)
      team_1a = create(:team, league: league_1)
      team_1b = create(:team, league: league_1)
      team_2a = create(:team, league: league_2)
      user_1.teams << [team_1a, team_2a]
      user_2.teams << [team_1a] if user_2
    end
  end

  trait :retired_with_existing_users do
    after(:create) do |season|
      season.update(status: "retired")
      user_1 = User.first
      user_2 = User.second
      league_1 = create(:league, season: season)
      league_2 = create(:league, season: season)
      team_1a = create(:team, league: league_1)
      team_1b = create(:team, league: league_1)
      team_2a = create(:team, league: league_2)
      user_1.teams << [team_1a, team_2a]
      user_2.teams << [team_1a] if user_2
    end
  end
end
