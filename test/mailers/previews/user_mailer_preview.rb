class UserMailerPreview < ActionMailer::Preview

  def order_receipt_email
    user = User.find(2)
    order = Order.find(2)
    UserMailer.order_receipt_email(user, order)
  end

end