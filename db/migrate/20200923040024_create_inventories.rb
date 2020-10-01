class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :type

      t.timestamps null: false
    end
  end
end
