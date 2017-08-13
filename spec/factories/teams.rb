FactoryGirl.define do
  factory :team do
    sequence :name {|n| "Active Team #{n}"}
    league
  end

  trait :in_retired_league do
    before(:create) do |team|
      team.name.gsub!("Active", "Retired")
      team.league.season.status = 1
    end
  end
end
