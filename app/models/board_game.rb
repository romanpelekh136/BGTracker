class BoardGame < ApplicationRecord
  has_many :matches

  has_many :player_ratings
  has_many :players, through: :player_ratings

  validates :name,
    presence: true,
    uniqueness: true

  validates :min_players, :max_players, numericality: { greater_than: 1 }
end
