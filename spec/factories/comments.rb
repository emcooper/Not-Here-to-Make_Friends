FactoryGirl.define do
  factory :comment do
    message "MyString"
    user
    league
  end
end
