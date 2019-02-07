class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :list1
      t.string  :list2
      t.string  :list3
      t.string  :list4
      t.string  :list5
      t.string  :list6
      t.string  :list7
      t.string  :list8

      t.timestamps
    end
  end
end



      # - 5.times do |j|
      #  = t.string :list"#{j + 1}"
