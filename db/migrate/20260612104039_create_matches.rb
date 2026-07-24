class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :board_game, null: false, foreign_key: true
      t.datetime :played_at

      t.timestamps
    end
  end
end
