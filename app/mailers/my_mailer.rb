class MyMailer < ActionMailer::Base
  default :from => 'demo.simplicio@gmail.com'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

  def new_receipt(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your purchase on our website went great! Log in to see the details!' )
  end
end
