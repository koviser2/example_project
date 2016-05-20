class Team < ActiveRecord::Base
  include Modules::UserChanges
  translates :director, :operator
  accepts_nested_attributes_for :translations
  has_many :skins
end
