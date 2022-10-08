class PowerHoursAddToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :power_hours, :add_to_list, :boolean, :default => false
  end
end
