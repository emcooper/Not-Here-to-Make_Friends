class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.date :date
      t.integer :week_number
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
