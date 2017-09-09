class AddAgeHometownOccupationToContestants < ActiveRecord::Migration[5.1]
  def change
    add_column :contestants, :age, :integer
    add_column :contestants, :hometown, :string
    add_column :contestants, :occupation, :string
  end
end
