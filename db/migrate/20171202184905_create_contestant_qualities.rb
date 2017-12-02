class CreateContestantQualities < ActiveRecord::Migration[5.1]
  def change
    create_table :contestant_qualities do |t|
      t.float :percentage
      t.references :contestant, foreign_key: true
      t.references :quality, foreign_key: true

      t.timestamps
    end
  end
end
