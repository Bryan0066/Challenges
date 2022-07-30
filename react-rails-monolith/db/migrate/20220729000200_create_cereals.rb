class CreateCereals < ActiveRecord::Migration[6.1]
  def change
    create_table :cereals do |t|
      t.string :name , null: false
      t.string :brand , null: false
      t.string :sugar_level

      t.timestamps null: false 
    end
  end
end
