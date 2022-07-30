class CreateAssignmentsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :project, null: false
      
      t.timestamps null: false
    end
  end
end
