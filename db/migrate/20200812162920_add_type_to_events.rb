class AddTypeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :type, foreign_key: true
  end
end
