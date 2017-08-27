class RenamePlaysSeasonTypeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :plays, :season_type_id, :season_type
  end
end
