class UpdatedArticleMailer < ApplicationMailer
    default from: 'justin@accr.biz'

  def updated_article(email, article)
    @email = email
    @article = article

    mail(
      to: email.email,
      subject: "Updated information to article #{@article.title} on hrsurvival.com"
      )
  end
end
