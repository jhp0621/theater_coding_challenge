# Preview all emails at http://localhost:3000/rails/mailers/order_confirmation_mailer
class OrderConfirmationMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_confirmation
  def order_confirmation_email
    order = Order.first
    OrderConfirmationMailer.order_confirmation_email(order)
  end
end
