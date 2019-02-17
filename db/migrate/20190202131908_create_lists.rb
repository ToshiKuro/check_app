class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :flight_number, index: true
      t.string  :item
      t.string  :address

      t.timestamps
    end
  end
end
