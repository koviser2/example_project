class About < ActiveRecord::Base
  default_scope { order(index: :asc, created_at: :desc) }
  mount_uploader :picture, AboutUploader
  translates :first_name, :last_name, :position, :describe, :picture_name
  accepts_nested_attributes_for :translations
  Translation.mount_uploader :picture_name, PicnameUploader
  validates :picture, dimensions: { width: 1102, height: 1656 }, allow_blank: true
end