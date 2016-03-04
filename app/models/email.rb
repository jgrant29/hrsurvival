class Email < ActiveRecord::Base


  validates :email, uniqueness: true
  validates :email, presence: true

  def self.unsubscribe(id)
    Email.find(id).update_attributes(permissions: false)
  end


  after_create :send_welcome_message
  
   def send_welcome_message
      WelcomeMailer.welcome_email(self).deliver_later
    end
end
