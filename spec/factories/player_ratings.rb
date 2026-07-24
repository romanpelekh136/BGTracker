FactoryBot.define do
  factory :player_rating do
    board_game
    player
    rating { rand(800..1200) }
  end
end
