class TableofcontentsNewNoticationMailer < ApplicationMailer
  default from: 'justin@accr.biz'

  def new_tableofcontent(email, tableofcontent)
    @email = email
    @tableofcontent = tableofcontent

    mail(
      to: email.email,
      subject: "New regulation #{@tableofcontent.title} on hrsurvival.com"
      )
  end
end