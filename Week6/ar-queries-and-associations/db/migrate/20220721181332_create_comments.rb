class CreateComments < ActiveRecord::Migration[6.1]
  def change

    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :recipe, null: false
      t.timestamps null: false
    end
    
  end
end
