class OrderMailer < ActionMailer::Base
  default from: "notification@pearplanes.com"

  def buy_now(order, price, provider)
    @order = order
    @price = price
    @provider = provider
    @url  = 'http://pearplanes.com/'
    mail(to: @order.email, subject: 'Time to buy your ticket!') do |format|
      format.text
    end
  end

  def no_flights(order)
    @order = order
    @url = 'http://pearplanes.com/'
    mail(to: @order.email, subject: 'We found no flights matching your criteria.') do |format|
      format.text
    end  
  end
end
