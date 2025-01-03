class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    @product = params[:product]
    @subscriber = params[:subscriber]

    raise ArgumentError, "Subscriber cannot be nil" if @subscriber.nil?

    mail(
      to: @subscriber.email,
      subject: "#{@product.name} is back in stock!"
    )
  end
end
