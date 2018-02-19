class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :locations, :location_groups do |t|
      t.index [:location_id, :location_group_id], name: 'idx_location_id_location_group_id'
      t.index [:location_group_id, :location_id], name: 'idx_location_group_id_location_id'
    end
  end
end
