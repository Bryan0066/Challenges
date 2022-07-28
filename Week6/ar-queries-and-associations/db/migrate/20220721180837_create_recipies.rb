class CreateRecipies < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.timestamps null: false
    end
    
  end
end
