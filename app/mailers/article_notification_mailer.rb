class ArticleNotificationMailer < ApplicationMailer
    default from: 'justin@accr.biz'

  def new_article(email, article)
    @email = email
    @article = article

    mail(
      to: email.email,
      subject: "New article #{@article.title} on hrsurvival.com"
      )
  end
end
