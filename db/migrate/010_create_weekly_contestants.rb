class CreateWeeklyContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_contestants do |t|
      t.references :contestant, foreign_key: true
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
