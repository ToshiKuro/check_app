class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name
      t.references :list, index: true
      t.string     :path
      
      t.timestamps
    end
  end
end

