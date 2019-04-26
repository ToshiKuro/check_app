class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.integer  :user_id
      t.integer  :list_id
      t.integer  :source_id
      t.datetime :acknowledgment
      t.string   :fuel
      t.string   :fl
      t.string   :msg
      t.date     :date
      t.time     :etd
      t.string   :send_list

      t.timestamps
    end
  end
end


      # t.references  :user, index: true, foreign_key: true
      # t.references  :list, index: true, foreign_key: true
