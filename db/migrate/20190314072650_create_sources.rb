class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.integer  :col1
      t.integer  :col2
      t.date     :col3
      t.string   :col4
      t.string   :col5
      t.string   :col6
      t.string   :col7
      t.time     :col8
      t.time     :col9
      t.string   :col10
      t.string   :col11
      t.string   :col12
      t.integer  :col13
      t.integer  :col14
      t.integer  :col15
      t.integer  :col16
      t.integer  :col17
      t.integer  :col18
      t.integer  :col19
      t.integer  :col20

      t.timestamps
    end
  end
end
