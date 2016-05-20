class Category < ActiveRecord::Base
  include Modules::UserChanges
  default_scope { order(index: :asc, created_at: :desc) }
  has_many :skins
  translates :name
  accepts_nested_attributes_for :translations
end