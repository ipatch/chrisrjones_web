class SectionEdit < ActiveRecord::Base
  # attr_accessible :title, :body

  # the below line will work
  # belongs_to :admin_user

  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"

  belongs_to :section 
end
