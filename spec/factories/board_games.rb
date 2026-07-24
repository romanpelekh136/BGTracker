FactoryBot.define do
  factory :board_game do
    title { Faker::Game.title }
    description { 'some description for board game' }
    min_players { rand(2..4) }
    max_players { rand(min_players..10) }
  end
end
