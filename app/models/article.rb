class Article < ActiveRecord::Base
  searchkick word_start: [:title, :body], highlight: [:body], settings: {number_of_shards: 1}
  mount_uploader :blogpicture, BlogpictureUploader
end
