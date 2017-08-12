FactoryGirl.define do
  factory :team do
    sequence :name {|n| "Active Team #{n}"}
    league
  end

  trait :in_retired_league do
    after(:create) do |team|
      team.name.gsub!("Active", "Retired")
      team.league = create(:league, :in_retired_season)
    end
  end
end
