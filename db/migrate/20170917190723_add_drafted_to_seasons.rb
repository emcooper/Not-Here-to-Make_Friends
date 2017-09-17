class AddDraftedToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :drafted, :boolean, default: false
  end
end
