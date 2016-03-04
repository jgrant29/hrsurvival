class Tableofcontent < ActiveRecord::Base
  searchkick word_start: [:title, :body], highlight: [:body]
  belongs_to :chapter  
  belongs_to :book
  has_many :favorites, dependent: :destroy
  has_many :emails


  default_scope { order('title ASC') }

  after_create :send_toc_new_notifications!
  after_update :send_toc_update_notifications!

     def send_toc_update_notifications!
      email = Email.where(permissions: true)
      email.each do |email|
         TableofcontentsUpdatedNoticationMailer.updated_tableofcontent(email, self).deliver_later
       end
     end

    def send_toc_new_notifications!
      email = Email.where(permissions: true)
      email.each do |email|
        TableofcontentsNewNoticationMailer.new_tableofcontent(email, self).deliver_later
      end
    end
  end
