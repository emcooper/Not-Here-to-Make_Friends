FactoryGirl.define do
  factory :season do
    sequence :first_name {|n| "first_name #{n}"}
    sequence :last_name {|n| "last_name #{n}"}
    sequence :season_number {|n| n}
    season_type 1
    status 0
  end
end
