class Single < ActiveRecord::Base
  attr_accessible :release_date, :title, :writer_id

  belongs_to :writer, class_name: "Artist"
  has_many :recordings

  alias :covers :recordings #rev: not sure i follow this.

   validates :title, :writer, :release_date, presence: true
end
