class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.belongs_to :attendee, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
    add_index :attendances, [:attendee_id, :event_id], unique: true
  end
end
