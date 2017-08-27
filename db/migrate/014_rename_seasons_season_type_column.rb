class RenameSeasonsSeasonTypeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :seasons, :season_type_id, :season_type
  end
end
