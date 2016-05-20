class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable
  enum role: ["Admin", "Manager", "Content Manager"]
  validates :email, presence: true, uniqueness: true
  validates :password, :presence =>true, on: :create
  validates :password, :confirmation =>true, :length => { :minimum => 8, :maximum => 40 }, :allow_blank => true
  include Modules::UserChanges

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

  def authorize_resource
    unless skip?(:authorize)
      @controller.authorize!(authorization_action, resource_instance || resource_class_with_parent)
    end
  end

end
