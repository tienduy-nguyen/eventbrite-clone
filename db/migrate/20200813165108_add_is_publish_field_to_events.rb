class AddIsPublishFieldToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :is_publish, :boolean
  end
  def down
    remove_column :events, :is_publish
  end
end
