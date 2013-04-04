class CreateBandArtists < ActiveRecord::Migration
  def change
    create_table :band_artists do |t|
      t.integer :artist_id, null: false
      t.integer :band_id, null: false

      t.timestamps
    end
  end
end
