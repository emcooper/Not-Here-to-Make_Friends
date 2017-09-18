FactoryGirl.define do
  factory :team do
    sequence :name {|n| "Active Team #{n}"}
    league
  end

  trait :with_draft_picks do
    after(:create) do |team|
      Season.find_by(status: "active").contestants.all.each_with_index do |contestant, i|
        create(:draft_pick, contestant: contestant,
                            team: team,
                            rank: i + 1
                        )
      end
    end
  end
end
