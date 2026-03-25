class AddPaceToRuns < ActiveRecord::Migration[7.1]
  def change
    add_column :runs, :pace, :string
  end
end
