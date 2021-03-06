class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :favorites, dependent: :destroy

  def favorited(article)
    favorites.where(article_id: article.id).first 
  end
  
  def admin?
    role == "admin"
  end

  def premium?
    role == "premium"
  end

  def email?
    role == "email"
  end

  protected
    # def confirmation_required?
    #   false
    # end

    # def password_required?
    #  new_record? ? false : super
    # end
end
