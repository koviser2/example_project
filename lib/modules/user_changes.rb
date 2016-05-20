module Modules

  module UserChanges

    def self.included(base)
      base.before_save :user_change_update
      base.has_many    :user_changes, as: :tableedit, dependent: :delete_all
      base.has_many    :admin_users, through: :user_changes
    end  

    def user_change_update
      self.admin_users << AdminUser.current if AdminUser.current
    end 

  end

end