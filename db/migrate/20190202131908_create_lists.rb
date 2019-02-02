class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string  :name
      t.string  :item
      t.string  :address

      t.timestamps
    end
  end
end
