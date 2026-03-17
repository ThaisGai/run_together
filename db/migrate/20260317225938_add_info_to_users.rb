class AddInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :text
    add_column :users, :birth_date, :date
  end
end
