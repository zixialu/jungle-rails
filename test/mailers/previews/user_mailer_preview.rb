class UserMailerPreview < ActionMailer::Preview

  def order_receipt_email
    user = User.first
    order = Order.first
    UserMailer.order_receipt_email(user, order)
  end

end