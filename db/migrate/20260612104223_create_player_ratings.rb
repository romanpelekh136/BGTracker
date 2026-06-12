class CreatePlayerRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :player_ratings do |t|
      t.belongs_to :board_game, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
