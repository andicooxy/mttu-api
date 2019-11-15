class CreateOffenders < ActiveRecord::Migration[5.2]
  def change
    create_table :offenders do |t|
      t.timestamps
      t.string :full_name, null: false
      t.string :vehicle_no, null: false 
      t.string   :statement
      # t.string :offenses_ids
      t.string :driver_liences_no 
      t.string :email 
      t.string :vehicle_type 
      t.datetime :date_of_issue 
      t.string :city_town 
      t.string :address 
      t.string :number_of_poeple 
      t.string :phone_number, null: false , index: true 
      t.boolean :ambolance_needed, default: false
      t.boolean :injured_people, default: false
      t.boolean :toll_track_needed, default: false
    end
  end
end
