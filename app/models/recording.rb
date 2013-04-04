class Recording < ActiveRecord::Base
  attr_accessible :band_id, :single_id
  belongs_to :band
  belongs_to :single

  validates :band, :single, presence: true
end
