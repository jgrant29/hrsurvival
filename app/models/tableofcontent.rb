class Tableofcontent < ActiveRecord::Base
  belongs_to :chapter  
  belongs_to :book


  default_scope { order('title ASC') }
end
