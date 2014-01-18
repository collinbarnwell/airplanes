class OrdersController < ApplicationController
  def new
    @order = Order.new
    @bad_airlines = BadAirline.all
    @airports = Airport.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render action: 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
    @bad_airlines = BadAirline.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
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
    params.require(:order).permit(:email, :max_price, :return_time_start, :return_time_end, 
                                  :departure_time_start, :departure_time_end, :start_airport_id,
                                  :end_airport_id)
  end
end
