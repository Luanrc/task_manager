class CreateZoneScope < ActiveRecord::Migration[5.2]
  def change
    create_table :zone_scopes do |t|
      t.string :name
      t.float :green_zone
      t.float :yellow_zone
      t.float :red_zone
      t.float :total_hours
      t.float :expended_hours, default: 0
      t.float :progress, default: 0

      t.timestamps
    end
  end
end
