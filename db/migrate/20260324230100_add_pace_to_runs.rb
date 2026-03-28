class AddPaceToRuns < ActiveRecord::Migration[7.1]
  def change
    add_column :runs, :pace, :string unless column_exists?(:runs, :pace)
  end
end
