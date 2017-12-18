class AddPlayTypeToPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :plays, :play_type, :integer
  end
end
