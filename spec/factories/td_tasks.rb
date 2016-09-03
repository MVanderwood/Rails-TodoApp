# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :td_task do
    association :project
    description { Faker::Lorem.sentence(3) }
    completed false
    priority 1
  end
end
