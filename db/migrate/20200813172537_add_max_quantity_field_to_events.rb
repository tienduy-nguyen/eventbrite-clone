class AddMaxQuantityFieldToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :max_quantity, :string
  end
  def down
    remove_column :events, :max_quantity
  end
end
