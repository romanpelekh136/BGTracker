# cleaning data
MatchResult.destroy_all
PlayerRating.destroy_all
Match.destroy_all
BoardGame.destroy_all
Player.destroy_all
puts "Deleted old data"
# creating seed data

# Players
10.times do
  Player.create!(
    username: Faker::Internet.unique.username(specifier: 4..20),
    password: 'password123'
  )
end
puts "Created players"

# Board games

5.times do
  min = rand(1..4)
  BoardGame.create!(
    title: Faker::Game.title,
    description: "Some big description!Some big description!
    Some big description!Some big description!",
    min_players: min,
    max_players: rand(min..10)
  )
end
puts "Created board games"

5.times do
  game = BoardGame.all.sample

  player_count = rand(game.min_players..game.max_players)

  match_players = Player.all.sample(player_count)

  match = Match.create!(
    board_game: game,
    played_at: Faker::Time.between(from: 2.weeks.ago, to: Time.now)
  )

  raw_results = match_players.map do |player|
    {
      player: player,
      score: rand(50..120)
    }
  end

  sorted_results = raw_results.sort_by { |r| -r[:score] }

  sorted_results.each_with_index do |result_data, index|
    current_rank = index + 1

    if index > 0 && result_data[:score] == sorted_results[index-1][:score]
      current_rank = MatchResult.where(match: match).last.rank
    end

    MatchResult.create!(
      match: match,
      player: result_data[:player],
      score: result_data[:score],
      rank: current_rank
    )
  end
end
puts "Created matches and match results"
