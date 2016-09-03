# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    description { Faker::Lorem.sentence(3) }
    after(:build) do |project|
      4.times do
        project.tasks << FactoryGirl.build(:task, project: project)
      end
    end
  end
end
