class LocationPicture < ActiveRecord::Base
  default_scope { order(index: :asc, created_at: :desc) }
  belongs_to :location
  mount_uploader :picture, DefaultUploader

  def self.show
    includes(:location).where(locations: {show: :true}).where(location_pictures: {show: true})
  end
end