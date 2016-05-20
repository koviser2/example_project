class ClientDashboard < ActiveRecord::Base
  include Modules::UserChanges
  has_many :clients
  accepts_nested_attributes_for :clients, :allow_destroy => true
  has_many :client_translations, through: :clients
  translates :footer
  accepts_nested_attributes_for :translations
  def to_s
    "Clients"
  end 
end