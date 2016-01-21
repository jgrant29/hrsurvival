class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :tableofcontents

    default_scope { order('title ASC') }

end
