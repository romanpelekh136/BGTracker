class Match < ApplicationRecord
  has_many :match_results
  has_many :players, through: :match_results

  belongs_to :board_game

  accepts_nested_attributes_for :match_results, reject_if: :all_blank

  validates :played_at, presence: true

  validate :player_count_within_limits

  private

  def player_count_within_limits
    return unless board_game.present?

    active_players = match_results.size

    if board_game.max_players.present? && active_players > board_game.max_players
      errors.add(:base, "This game allows a maximum of #{board_game.max_players} players.")
    end

    if board_game.min_players.present? && active_players < board_game.min_players
      errors.add(:base, "This game requires at least #{board_game.min_players} players.")
    end
  end
end
