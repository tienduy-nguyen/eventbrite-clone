class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.integer :duration
      t.datetime :start_at
      t.text :description
      t.integer :price
      t.string :type
      t.string :location
      t.string :img_url
      t.float :loc_lat
      t.float :loc_long
      
      t.belongs_to :organizer, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
