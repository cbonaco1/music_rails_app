class Track < ActiveRecord::Base
  TRACK_TYPES = %w(bonus, regular)

  validates :album_id, :lyrics, presence: true
  validates :track_type, :inclusion { in: TRACK_TYPES }

  belongs_to(
    :album,
    :class_name => 'Album',
    :foreign_key => :album_id,
    :primary_key => :id
  )


end
