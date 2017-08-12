FactoryGirl.define do
  factory :season do
    first_name "MyString"
    last_name "MyString"
    season_number 1
    season_type
    status 0
  end

  trait :retired do
    after(:create) do |season|
      season.status = 1
    end
  end
end
