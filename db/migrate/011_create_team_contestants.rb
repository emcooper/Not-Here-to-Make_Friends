class CreateTeamContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :team_contestants do |t|
      t.references :contestant, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
