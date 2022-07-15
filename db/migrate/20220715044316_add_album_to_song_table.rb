class AddAlbumToSongTable < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :album, :string
    rename_column :songs, :song_title, :title
    rename_column :songs, :song_artist, :artist
  end
end
