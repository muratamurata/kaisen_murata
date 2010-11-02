class Notifier < ActionMailer::Base
  default :from => "kaisen-murata@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifer.ordered.subject
  #
  def ordered(order)
    @greeting = "Hi"
    @order = order

    mail :to => @order.email, :cc => "eringimazui@gmail.com", :subject => "注文よし"
  end
end
