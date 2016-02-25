class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :tableofcontents, dependent: :destroy

    default_scope { order('title ASC') }

end
