class UserMailer < ApplicationMailer
  def order_receipt_email(user, order)
    @user = user
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Order receipt ##{@order.id}')
  end
end
