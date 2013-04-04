class Band < ActiveRecord::Base
  attr_accessible :name, :artist_ids, :image
  
  has_many :band_artists
  has_many :artists, :through => :band_artists
  has_many :recordings
  has_attached_file :image

  validates :name, presence: true

  def has_image?
  	self.image_file_name
  end
end
