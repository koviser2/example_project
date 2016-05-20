class Casting < ActiveRecord::Base
  default_scope { order(index: :asc, created_at: :desc) }
  mount_uploader :picture, CastingUploader
  enum people_type: ["women","men","kids"]
end