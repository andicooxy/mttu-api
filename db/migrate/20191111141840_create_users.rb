class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false , index: true 
      t.string  :password_digest
      t.string "full_name"
      t.string "first_name"
      t.string "last_name"
      t.string "phone_number"
      t.boolean "is_active", default: true
      t.boolean "is_archived", default: false
      t.integer "pass_login_count", default: 0
      t.boolean "has_reset_password", default: false
      t.boolean "has_password_locked", default: false
      t.boolean "blocked", default: false
      t.integer "pas_login_count", default: 0
      t.datetime "last_password_reset_date"
      t.boolean "verified", default: false
      t.belongs_to :department, index: true 
      t.belongs_to :region, index: true
      t.belongs_to :user_type, index: true 
      t.string :town
      t.timestamps
    end
  end
end
