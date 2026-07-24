class CreateMatchResults < ActiveRecord::Migration[8.0]
  def change
    create_table :match_results do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :score
      t.integer :rank

      t.timestamps
    end
  end
end
