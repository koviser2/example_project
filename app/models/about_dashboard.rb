class AboutDashboard < ActiveRecord::Base
  translates :describe, :adress
  accepts_nested_attributes_for :translations
end