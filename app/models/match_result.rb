class MatchResult < ApplicationRecord
  belongs_to :match
  belongs_to :player

  validates :rank, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0, only_integer: true }, allow_blank: true
end
