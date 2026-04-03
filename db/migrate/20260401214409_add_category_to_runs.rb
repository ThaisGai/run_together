class AddCategoryToRuns < ActiveRecord::Migration[7.1]
  def change
    add_column :runs, :women_only, :boolean, default: false
    add_column :runs, :max_participants, :integer, default: 5
  end
end
