class AddEndAtToEvent < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :end_at, :datetime
  end
  def down
    remove_column :events, :end_at
  end
end
