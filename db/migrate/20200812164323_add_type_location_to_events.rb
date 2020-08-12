class AddTypeLocationToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :type_location, :string
  end

  def down
    remove :column, :type_location
  end
end
