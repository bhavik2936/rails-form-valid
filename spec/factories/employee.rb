FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    dob { Faker::Date::birthday(min_age: 18, max_age: 65) }
    mobile { Faker::Number.number(digits: 10) }
    designation { Faker::Lorem.word }
    salary { Faker::Number.positive }
    association :manager
  end
end
