class CreatePowerHours < ActiveRecord::Migration[6.1]
  def change
    create_table :power_hours do |t|
      t.string :title
      t.string :description, default: ""
      t.string :cover_image
      t.string :date_time, default: ""
      t.timestamps
    end
  end
end
