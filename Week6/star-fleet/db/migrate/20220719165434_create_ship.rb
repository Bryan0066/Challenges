class CreateShip < ActiveRecord::Migration[6.1]
  def change
    create_table :ships do |t|
      t.string :name, null: false
      t.string :ship_class, null: false
      t.string :location, null: false
    end
  end
end
