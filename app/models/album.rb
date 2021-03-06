class Album < ActiveRecord::Base
  ALBUM_TYPES = %w(live studio)

  validates :name, :band_id, presence: true
  validates :album_type, inclusion: { in: ALBUM_TYPES }

  belongs_to(
    :band,
    :class_name => 'Band',
    :foreign_key => :band_id,
    :primary_key => :id
  )

  has_many(
    :tracks,
    :class_name => 'Track',
    :foreign_key => :album_id,
    :primary_key => :id,
    dependent: :destroy
  )
  #deleting an album also deletes its tracks
end
