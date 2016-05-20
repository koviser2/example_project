class Award < ActiveRecord::Base
  include Modules::UserChanges
  has_many :award_skins, :dependent => :delete_all
  has_many :skins, through: :award_skins
  mount_uploader :picture, AwardUploader
end
