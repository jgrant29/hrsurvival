class Tableofcontent < ActiveRecord::Base
  searchkick word_start: [:title, :body], highlight: [:body]
  belongs_to :chapter  
  belongs_to :book


  default_scope { order('title ASC') }
end
