class UpdateCards < ActiveRecord::Migration
  def change
    add_column :cards, :guessed_correctly, :binary, default: 0
  end
end
