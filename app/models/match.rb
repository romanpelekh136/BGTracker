class Match < ApplicationRecord
  has_many :match_results
  has_many :players, through: :match_results

  belongs_to :board_game

  accepts_nested_attributes_for :match_results, reject_if: :all_blank

  validates :played_at, presence: true

  validate :player_count_within_limits
  validate :players_must_be_uniq
  validate :must_have_a_winner

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

  def must_have_a_winner
    active_ranks = match_results.map(&:rank)

    unless active_ranks.include?(1)
      errors.add(:base, "A match must have a First-place winner.")
    end
  end

  def players_must_be_uniq
    active_players_id = match_results.map(&:player_id).compact

    if active_players_id.size != active_players_id.uniq.size
      errors.add(:base, "A player can be added to a match once.")
    end
  end
end
