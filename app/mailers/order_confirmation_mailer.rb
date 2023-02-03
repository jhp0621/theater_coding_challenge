class OrderConfirmationMailer < ApplicationMailer
  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thanks for your order')
  end
end
