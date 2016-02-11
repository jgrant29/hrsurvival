class Tableofcontent < ActiveRecord::Base
  searchkick word_start: [:title, :body], highlight: [:body], settings: {number_of_shards: 1}
  belongs_to :chapter  
  belongs_to :book


  default_scope { order('title ASC') }
end
