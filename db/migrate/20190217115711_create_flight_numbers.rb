class CreateFlightNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_numbers do |t|
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
