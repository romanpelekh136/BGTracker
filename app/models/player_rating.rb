class PlayerRating < ApplicationRecord
  belongs_to :board_game
  belongs_to :player
end
