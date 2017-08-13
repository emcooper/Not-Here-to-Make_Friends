FactoryGirl.define do
  factory :user do
    name "MyString"
    sequence :email {|n| "user#{n}@gmail.com"}
    password "password1234"
    role 1
  end
end
