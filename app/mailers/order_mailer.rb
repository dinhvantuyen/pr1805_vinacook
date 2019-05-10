class OrderMailer < ApplicationMailer
  default from: 'pr1805vinacook@gmail.com'
  layout 'mailer'
  def order_email(order)
    @order = order
    mail(to: order.email, subject: 'Order Email')
  end
end
