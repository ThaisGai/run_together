class AddRunsCompletedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :runs_completed, :integer
  end
end
