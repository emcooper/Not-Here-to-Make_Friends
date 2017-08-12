FactoryGirl.define do
  factory :team do
    sequence :name {|n| "Team #{n}"}
    league
  end

  trait :in_retired_league do
    after(:create) do |team|
      team.league = create(:league, :in_retired_season)
    end
  end
end
