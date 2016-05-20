class Client < ActiveRecord::Base
  belongs_to :client_dashboard
  mount_uploader :picture, AwardUploader
  translates :name
  accepts_nested_attributes_for :translations
  has_many :client_translations, :dependent => :delete_all
  default_scope { order(index: :asc, created_at: :desc) }

  def self.show
    where(show: true)
  end
end