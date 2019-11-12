class CreateOffenses < ActiveRecord::Migration[5.2]
  def change
    create_table :offenses do |t|

      t.timestamps
    end
  end
end
