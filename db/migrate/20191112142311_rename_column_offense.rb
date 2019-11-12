class RenameColumnOffense < ActiveRecord::Migration[5.2]
  def change
    rename_column :offenses, :name, :title 
  end
end
