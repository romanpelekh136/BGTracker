FactoryBot.define do
  factory :player do
    username { Faker::Internet.unique.username }
    password { 'password123' }
  end
end
