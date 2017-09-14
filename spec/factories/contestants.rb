FactoryGirl.define do
  factory :contestant do
    sequence(:name, ("A".."Z").cycle) {|n| "Bryan #{n}"}
    headshot "https://i.elitestatic.com/content/uploads/2017/07/10202710/bryan-abasolo-bachelor-player.jpg"
    bio "MyString"
    season
    age 37
    hometown "Miami, FL"
    occupation "Chripractor"
    twitter_handle "@TheAbDoctor"
  end
end
