class Artist < ActiveRecord::Base
  attr_accessible :name
  has_many :band_artists
  has_many :bands, :through => :band_artists
  has_many :singles, foreign_key: "writer_id"
  has_many :recordings, :through => :bands

  validates :name, presence: true
end
