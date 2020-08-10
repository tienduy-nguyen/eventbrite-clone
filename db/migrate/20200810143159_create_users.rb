class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default:""
      t.text :description
      t.string :avatar
      t.string :phone
      t.string :sex
      t.string :address
      t.string :job
      t.string :company
      t.string :website

      t.timestamps
    end
  end
end
