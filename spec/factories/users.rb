FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    
    trait :patient do
      role { 'patient' }
    end

    trait :doctor do
      role { 'doctor' }
    end
  end
end