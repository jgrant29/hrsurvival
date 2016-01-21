class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  has_many :tableofcontents, dependent: :destroy
end
