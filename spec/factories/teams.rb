FactoryGirl.define do
  factory :team do
    sequence :name {|n| "Active Team #{n}"}
    league
  end

  trait :in_retired_league do
    after(:create) do |team|
      team.name.gsub!("Active", "Retired")
      team.league.season.update(status: "retired")
      new_league_name = team.league.name.gsub("Active", "Retired")
      team.league.update(name: new_league_name)
    end
  end
end
