class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name, null: false, index: false 
      t.timestamps
    end
  end
end
