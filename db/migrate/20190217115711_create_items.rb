class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :list, index: true
      t.string     :name
      t.string     :path
      
      t.timestamps
    end
  end
end

