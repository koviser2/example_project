class CreateChanges < ActiveRecord::Migration
  def change
    create_table :user_changes do |t|
      t.belongs_to :admin_user, index: true
      t.references :tableedit, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
