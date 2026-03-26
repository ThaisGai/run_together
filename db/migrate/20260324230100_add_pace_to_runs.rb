class AddPaceToRuns < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:runs, :pace)
      add_column :runs, :pace, :float
    end
  end
end
