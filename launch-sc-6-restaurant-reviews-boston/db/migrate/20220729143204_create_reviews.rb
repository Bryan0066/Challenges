class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false

      t.timestamps null: false

      t.belongs_to :restaurant
    end
  end
end
