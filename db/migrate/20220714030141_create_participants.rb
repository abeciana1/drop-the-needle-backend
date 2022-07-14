class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :power_hour_id
      t.timestamps
    end
  end
end
