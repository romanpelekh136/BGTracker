class Match < ApplicationRecord
  has_many :match_results
  has_many :players, through: :match_results

  belongs_to :board_game
end
