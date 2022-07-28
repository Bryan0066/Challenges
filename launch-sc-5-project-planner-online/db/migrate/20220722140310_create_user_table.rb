class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name, null:false
      t.string :email
      t.timestamps null: false
    end
  end
end
