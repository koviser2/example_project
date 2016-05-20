class AwardSkin < ActiveRecord::Base
  belongs_to :skin
  belongs_to :award
end
