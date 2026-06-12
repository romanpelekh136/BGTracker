class RenamePasswordToPasswordDigestInPlayers < ActiveRecord::Migration[8.0]
  def change
    rename_column :players, :password, :password_digest
  end
end
