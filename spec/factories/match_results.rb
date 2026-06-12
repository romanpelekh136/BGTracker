FactoryBot.define do
  factory :match_result do
    match
    player
    score { rand(10..100) }
    rank { rand(1..4) }
  end
end
