class CreateRuns < ActiveRecord::Migration[7.1]
  def change
    create_table :runs do |t|
      t.date :date
      t.time :time
      t.string :location
      t.string :pace
      t.boolean :private
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
