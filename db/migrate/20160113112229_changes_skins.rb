class ChangesSkins < ActiveRecord::Migration
  def change    
    change_column_default :skins, :show, true
  end
end
