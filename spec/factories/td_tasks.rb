# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :td_task do
    description "MyString"
    completed false
    priority 1
  end
end
