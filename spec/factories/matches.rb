FactoryBot.define do
  factory :match do
    board_game
    played_at { Faker::Time.between(from: 2.week.ago, to: Time.now) }
  end
end
