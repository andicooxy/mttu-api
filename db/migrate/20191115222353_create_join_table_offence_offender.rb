class CreateJoinTableOffenceOffender < ActiveRecord::Migration[5.2]
  def change
    # remove_colomn :offenders, :offenses_ids
    create_join_table :offenders, :offenses do |t|
      t.index [:offender_id, :offense_id]
      t.index [:offense_id, :offender_id]
    end
  end
end
