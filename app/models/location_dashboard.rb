class LocationDashboard < ActiveRecord::Base
  translates :describe
  accepts_nested_attributes_for :translations
end