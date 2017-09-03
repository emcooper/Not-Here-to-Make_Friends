FactoryGirl.define do
  factory :play do
    sequence :description {|n| "Received a Rose #{n}"}
    point_value 2
    season_type 1
  end
end
