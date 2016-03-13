class Article < ActiveRecord::Base
  searchkick word_start: [:title, :body], highlight: [:body]
  mount_uploader :blogpicture, BlogpictureUploader
  has_many :favorites, dependent: :destroy
  has_many :emails

  default_scope { order('title ASC') }

  after_create :send_new_notifications!

  after_update :send_update_notifications!
  
   def send_update_notifications!
    email = Email.where(permissions: true)
    email.each do |email|
       UpdatedArticleMailer.updated_article(email, self).deliver_later
     end
   end

  def send_new_notifications!
    email = Email.where(permissions: true)
    email.each do |email|
      ArticleNotificationMailer.new_article(email, self).deliver_later
    end
  end
end
