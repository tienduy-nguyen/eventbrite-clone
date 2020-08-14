class AddRoleUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :is_admin, :boolean
    add_column :events, :validated, :boolean
  end

  def def down 
    remove_column :users, :is_admin
    remove_column :events, :validated
  end
end
