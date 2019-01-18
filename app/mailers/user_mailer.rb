class UserMailer < ApplicationMailer
  def order_receipt_email(user, order)
    @user = user
    @order = order
    subject_line = "Order receipt ##{@order.id}"
    mail(to: @user.email, subject: subject_line)
  end
end
