class AddsHasDraftedToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :has_drafted?, :boolean
  end
end
