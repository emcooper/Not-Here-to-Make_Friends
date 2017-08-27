FactoryGirl.define do
  factory :team do
    sequence :name {|n| "Active Team #{n}"}
    league
  end
end
