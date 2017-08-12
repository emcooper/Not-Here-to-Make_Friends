FactoryGirl.define do
  factory :user do
    name "MyString"
    sequence :email {|n| "user#{n}@gmail.com"}
    password "password1234"
    role 1
  end

  trait :with_2_active_and_2_retired_teams do
    after(:create) do |user|
      user.teams << create_list(:team, 2)
      user.teams << create_list(:team, 2, :in_retired_league)
    end
  end
end
