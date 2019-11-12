class CreateOffenses < ActiveRecord::Migration[5.2]
  def change
    create_table :offenses do |t|
      t.belongs_to :user 
      t.string :name , null: false  
      t.string :description
      t.timestamps
    end
  end
end
