class Location < ActiveRecord::Base
  include Modules::UserChanges
  default_scope { order(index: :asc, created_at: :desc) }
  has_many :location_pictures, :dependent => :delete_all
  accepts_nested_attributes_for :location_pictures, :allow_destroy => true
  translates :name
  accepts_nested_attributes_for :translations
end