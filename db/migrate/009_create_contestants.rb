class CreateContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :headshot
      t.string :bio
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
