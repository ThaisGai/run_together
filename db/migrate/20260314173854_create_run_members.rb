class CreateRunMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :run_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
