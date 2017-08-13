FactoryGirl.define do
  factory :league do
    sequence :name {|n| "Active League #{n}"}
    season
  end

  trait :in_retired_season do
    after(:create) do |league|
      league.name.gsub!("Active", "Retired")
      league.season = create(:season, :retired)
    end
  end
end
