class AddTitleToRuns < ActiveRecord::Migration[7.1]
  def change
    add_column :runs, :title, :string
  end
end
