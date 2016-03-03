class Favorite < ActiveRecord::Base
  belongs_to :article
  belongs_to :tableofcontent
end
