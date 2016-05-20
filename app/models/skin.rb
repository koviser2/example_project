class Skin < ActiveRecord::Base
  include Modules::UserChanges
  default_scope { order(index: :asc, created_at: :desc) }
  belongs_to :category
  belongs_to :team
  mount_uploader :picture, SkinUploader
  translates :name, :client, :brand, :video
  accepts_nested_attributes_for :translations
  has_many :award_skins, :dependent => :delete_all
  has_many :awards, through: :award_skins
  accepts_nested_attributes_for :awards, :allow_destroy => true
  
  def self.show
    includes(:category).where(categories: {show: :true}).where(skins: {show: true})
  end

end