class NoticeMailer < ActionMailer::Base
  default from: "noreply@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(blog_title, entry, comment, url)
    @blog_title = blog_title
    @entry = entry
    @comment = comment
    @url = url

    mail to: "ytaoka@hotmail.com",
      subject: "新しいコメントが登録されました"
  end
end
