class Chapter < ActiveRecord::Base
  searchkick word_start: [:title]
  belongs_to :book
  has_many :tableofcontents, dependent: :destroy

    default_scope { order('title ASC') }

end
