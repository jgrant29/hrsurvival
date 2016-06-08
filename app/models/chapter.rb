class Chapter < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title
  belongs_to :book
  has_many :tableofcontents, dependent: :destroy

  default_scope { order('weight ASC') }
end
