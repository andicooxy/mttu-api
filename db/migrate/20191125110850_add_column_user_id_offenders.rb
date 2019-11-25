class AddColumnUserIdOffenders < ActiveRecord::Migration[5.2]
  def change
    add_column :offenders, :user_id, :integer, :index => true
  end
end
