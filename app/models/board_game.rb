class BoardGame < ApplicationRecord
  has_many :matches

  has_many :player_ratings
  has_many :players, through: :player_ratings

  validates :title,
    presence: true,
    uniqueness: true

  validates :min_players, :max_players, numericality: { greater_than: 0, only_integer: true }
  validates :max_players, comparison: {
    greater_than_or_equal_to: :min_players,
    message: "must be greater of equal to min_players" }
end
