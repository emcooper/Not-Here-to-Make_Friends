class CreatePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :plays do |t|
      t.string :description
      t.integer :point_value
      t.references :season_type, foreign_key: true

      t.timestamps
    end
  end
end
