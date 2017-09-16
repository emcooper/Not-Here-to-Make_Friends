FactoryGirl.define do
  factory :season do
    sequence :first_name {|n| "first_name #{n}"}
    sequence :last_name {|n| "last_name #{n}"}
    sequence :season_number {|n| n}
    season_type 1
    status 0
    draft_date "2017-08-10"
  end

  trait :with_contestants_and_points do
    after(:create) do |season|
      cont_1, cont_2, cont_3 = create_list(:contestant, 3, season: season)
      week_1 = create(:week, season: season, date: 1.week.ago, week_number: 1)
      week_2 = create(:week, season: season, date: Time.now, week_number: 2)
      week_1.contestants << [cont_1, cont_2, cont_3]
      week_2.contestants << [cont_2, cont_3]
      big_play = create(:play, point_value: 50)
      create(:action, week: week_1, contestant: cont_1, count: 2)
      create(:action, week: week_1, contestant: cont_1)

      create(:action, week: week_1, contestant: cont_2)
      create(:action, week: week_2, contestant: cont_2)

      create(:action, week: week_1, contestant: cont_3, play: big_play)
      create(:action, week: week_2, contestant: cont_3)
    end
  end
end
