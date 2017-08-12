FactoryGirl.define do
  factory :league do
    sequence :name {|n| "League #{n}"}
    season
  end

  trait :in_retired_season do
    after(:create) do |league|
      league.season = create(:season, :retired)
    end
  end
end
