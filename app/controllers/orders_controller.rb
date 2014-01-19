class OrdersController < ApplicationController
  def new
    @order = Order.new
    @bad_airlines = BadAirline.all
    @airports = Airport.all
  end

  def create
    start_date = DateTime.strptime(params[:order][:departure_time_start], '%m/%d/%Y')
    end_date = DateTime.strptime(params[:order][:return_time_start], '%m/%d/%Y')
    @order = Order.new(order_params)
    @order.return_time_start = end_date
    @order.departure_time_start = start_date
    if @order.save
      redirect_to @order
    else
      render action: 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
    @bad_airlines = BadAirline.all
    @airports = Airport.all
  end

  def update
    start_date = DateTime.strptime(params[:order][:departure_time_start], '%m/%d/%Y')
    end_date = DateTime.strptime(params[:order][:return_time_start], '%m/%d/%Y')
    @order = Order.find(params[:id])
    @order.assign_attributes(order_params)
    @order.return_time_start = start_date
    @order.departure_time_start = end_date
    if @order.save
      redirect_to @order
    else
      render action: 'edit'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:email, :max_price, :start_airport,
                                  :end_airport)
  end
end
