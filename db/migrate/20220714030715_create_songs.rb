class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :song_title
      t.string :song_artist
      t.string :youtube_link
      t.string :start_time
      t.string :end_time
      t.integer :power_hour_id
      t.integer :order_number
      t.integer :user_id
      t.timestamps
    end
  end
end
