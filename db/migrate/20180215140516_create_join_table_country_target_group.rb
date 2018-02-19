class CreateJoinTableCountryTargetGroup < ActiveRecord::Migration
  def change
    create_join_table :countries, :target_groups do |t|
      t.index [:country_id, :target_group_id], name: 'idx_country_id_target_group_id'
      t.index [:target_group_id, :country_id], name: 'idx_target_group_id_country_id'
    end
  end
end
