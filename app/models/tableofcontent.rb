class Tableofcontent < ActiveRecord::Base
  belongs_to :chapter  
  belongs_to :book

end
