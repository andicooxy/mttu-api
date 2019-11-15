class AddCityTown < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :town, :city_town
  end
end
