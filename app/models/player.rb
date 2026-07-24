class Player < ApplicationRecord
  has_many :match_results
  has_many :matches, through: :match_results

  has_many :player_ratings
  has_many :board_games, through: :player_ratings

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 25 }
  validates :password, length: { minimum: 8, maximum: 70 }
end
