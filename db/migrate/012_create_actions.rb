class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.references :contestant, foreign_key: true
      t.references :play, foreign_key: true
      t.references :week, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
