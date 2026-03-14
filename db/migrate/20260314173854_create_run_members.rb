class CreateRunMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :run_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :run,  null: false, foreign_key: true

      t.timestamps
    end

    add_index :run_members, [:user_id, :run_id], unique: true
  end
end
