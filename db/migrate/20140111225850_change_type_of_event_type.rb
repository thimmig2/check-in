class ChangeTypeOfEventType < ActiveRecord::Migration
  def change
    change_column :events, :type_id, :string
  end
end
