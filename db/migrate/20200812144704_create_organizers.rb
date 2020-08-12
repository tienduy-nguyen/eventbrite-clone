class CreateOrganizers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      t.string :name
      t.string :avatar
      t.string :bio
      t.string :website
      t.text :description
      t.string :facebook_username
      t.string  :twitter_username

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
