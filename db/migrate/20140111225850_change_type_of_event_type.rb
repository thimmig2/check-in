class ChangeTypeOfEventType < ActiveRecord::Migration
  def change
    change_column :Events, :type_id, :string
  end
end
