class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :first_name
      t.string :last_name
      t.integer :season_number
      t.references :season_type, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
