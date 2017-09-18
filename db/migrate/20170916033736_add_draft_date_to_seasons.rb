class AddDraftDateToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :draft_date, :date
  end
end
