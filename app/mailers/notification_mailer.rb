class NotificationMailer < ApplicationMailer
  default from: justin@accr.biz

  def new_article_toc(email, article, toc)
    @email = email
    @article = article
    @toc = tableofcontent

    mail(
      to: email.email,
      subject: "New article, #{article.title} on hrsurvival.com"
      )
  end

end
