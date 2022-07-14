class CreatePowerHours < ActiveRecord::Migration[6.1]
  def change
    create_table :power_hours do |t|
      t.string :title
      t.string :description
      t.string :cover_image
      t.string :date_time
      t.timestamps
    end
  end
end
