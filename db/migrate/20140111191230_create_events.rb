class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date_held
      t.integer :type_id

      t.timestamps
    end
  end
end
