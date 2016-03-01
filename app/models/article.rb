class Article < ActiveRecord::Base
  searchkick word_start: [:title, :body], highlight: [:body]
  mount_uploader :blogpicture, BlogpictureUploader
end
