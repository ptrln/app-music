class BandArtist < ActiveRecord::Base
  attr_accessible :artist_id, :band_id
  belongs_to :artist
  belongs_to :band

  validates :artist, :band, presence: true
end
