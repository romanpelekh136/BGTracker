class RenameBoardGameNameToTittle < ActiveRecord::Migration[8.0]
  def change
    rename_column :board_games, :name, :title
  end
end
