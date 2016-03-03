class TableofcontentsUpdatedNoticationMailer < ApplicationMailer
  default from: 'justin@accr.biz'

  def updated_tableofcontent(email, tableofcontent)
    @email = email
    @tableofcontent = tableofcontent

    mail(
      to: email.email,
      subject: "Updated information to #{@tableofcontent.title} on hrsurvival.com"
      )
  end
end
