class AddTwitterHandleToContestants < ActiveRecord::Migration[5.1]
  def change
    add_column :contestants, :twitter_handle, :string
  end
end
