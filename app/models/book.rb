class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :chapters, dependent: :destroy
  has_many :tableofcontents, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
