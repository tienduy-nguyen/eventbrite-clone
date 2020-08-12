class RemoveTypeFromEvents < ActiveRecord::Migration[5.2]
  def up
    remove_column :events, :type
  end
  def down
    remove_column :events, :type,:string
  end
end
