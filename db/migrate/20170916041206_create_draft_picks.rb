class CreateDraftPicks < ActiveRecord::Migration[5.1]
  def change
    create_table :draft_picks do |t|
      t.references :contestant, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :rank

      t.timestamps
    end
  end
end
