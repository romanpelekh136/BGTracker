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

  # 1. Generate scores in memory
  raw_results = match_players.map do |player|
    {
      player_id: player.id,
      score: rand(50..120)
    }
  end

  # 2. Sort by score descending
  sorted_results = raw_results.sort_by { |r| -r[:score] }

  # 3. Calculate ranks (including ties) and build the attributes array
  current_rank = 1
  match_results_attributes = sorted_results.map.with_index do |result_data, index|
    # If this isn't the first player, and their score is lower than the previous player's score, update the rank.
    # If the score is the same, current_rank stays the same (a tie).
    if index > 0 && result_data[:score] < sorted_results[index - 1][:score]
      current_rank = index + 1
    end

    {
      player_id: result_data[:player_id],
      score: result_data[:score],
      rank: current_rank
    }
  end

  # 4. Create the Match and MatchResults simultaneously
  Match.create!(
    board_game: game,
    played_at: Faker::Time.between(from: 2.weeks.ago, to: Time.now),
    match_results_attributes: match_results_attributes
  )
end

puts "Created matches and match results"
