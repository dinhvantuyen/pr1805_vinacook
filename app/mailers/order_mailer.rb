class OrderMailer < ApplicationMailer
  default from: 'pr1805vinacook@gmail.com'
  layout 'mailer'
  def order_email(email)
    mail(to: email, subject: 'Order Email')
  end
end
