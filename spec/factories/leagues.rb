FactoryGirl.define do
  factory :league do
    sequence :name {|n| "Active League #{n}"}
    season
  end
end
