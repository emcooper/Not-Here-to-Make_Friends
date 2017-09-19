FactoryGirl.define do
  factory :user do
    name "MyString"
    sequence :email {|n| "user#{n}@gmail.com"}
    password "password1234"
    role 1
  end

  trait :full_setup do
    after(:create) do |user|
      active_season = create(:season, status: "active")
      retired_season = create(:season, status: "retired")
      week_1 = create(:week, season: active_season)
      week_2 = create(:week, season: active_season)
      play_1, play_2 = create_list(:play, 2)
      active_league_1, active_league_2= create_list(:league, 2, season: active_season)
      retired_league = create(:league, season: retired_season)
      c1, c2, c3, c4 = create_list(:contestant, 4, season: active_season)
      retired_contestant = create(:contestant, season: retired_season)
      user_2 = create(:user)
      team_1, team_2 = create_list(:team, 2, league: active_league_1)
      team_3 = create(:team, league: active_league_2)
      retired_team = create(:team, league: retired_league)
      team_5 = create(:team, league: active_league_1)
      create(:team_member, user: user, team: team_1)
      create(:team_member, user: user, team: team_3)
      create(:team_member, user: user_2, team: team_2)
      create(:team_member, user: user, team: retired_team)
      create(:team_contestant, contestant: c1, team: team_1)
      create(:team_contestant, contestant: c2, team: team_1)
      create(:team_contestant, contestant: c3, team: team_2)
      create(:team_contestant, contestant: c4, team: team_5)
      create(:team_contestant, contestant: retired_contestant, team: retired_team)
      create(:action, contestant: c1, week: week_1, play: play_1)
      create(:action, contestant: c2, week: week_1, play: play_1, count: 2)
      create(:action, contestant: c3, week: week_1, play: play_1)
      create(:action, contestant: c3, week: week_2, play: play_2)
      create(:action, contestant: c4, week: week_1, play: play_2, count: 3)
      create(:action, contestant: c4, week: week_2, play: play_2, count: 5)
    end
  end
end
