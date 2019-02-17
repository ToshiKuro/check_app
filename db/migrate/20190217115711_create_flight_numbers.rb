class CreateFlightNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_numbers do |t|

      t.timestamps
    end
  end
end
