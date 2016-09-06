# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    description { Faker::Lorem.sentence(3) }
    after(:create) do |project|
      4.times do
        create(:td_task, project_id: project.id)
      end
    end
  end
end
