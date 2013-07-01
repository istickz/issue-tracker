class UserMailer < ActionMailer::Base



  default from: "temur.fatkulin@gmail.com"

  def new_issue_notification_email(user,id)
    @user = user
    @url  = ""
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
