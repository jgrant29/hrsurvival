class Chapter < ActiveRecord::Base
  searchkick text_start: [:body], highlight: [:body]
  belongs_to :book
  has_many :tableofcontents, dependent: :destroy

    default_scope { order('title ASC') }

end
