class Email < ActiveRecord::Base


  validates :email, uniqueness: true
  validates :email, presence: true

  def self.unsubscribe(id)
    Email.find(id).update_attributes(permissions: false)
  end

end
