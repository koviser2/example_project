class UserChange < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :tableedit, polymorphic: true
  before_create :luck_the_limit
  default_scope { order(created_at: :desc) }
  private
    def luck_the_limit
      limit = 10
      has = UserChange.where(tableedit: self.tableedit).count
      if has >= limit
        ids = UserChange.where(tableedit: self.tableedit).limit(limit-1).pluck(:id)
        UserChange.where(tableedit: self.tableedit).where.not(id: ids).destroy_all
      end
    end
end
