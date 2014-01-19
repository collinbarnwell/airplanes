class OrdersController < ApplicationController
  def new
    @order = Order.new
    @bad_airlines = BadAirline.all
    @airports = Airport.all
  end

  def create
    @order = Order.new
    @airports = Airport.all
    start_date = DateTime.strptime(params[:order][:departure_time_start], '%m/%d/%Y')
    end_date = DateTime.strptime(params[:order][:return_time_start], '%m/%d/%Y')
    start_airport = params[:order][:start_airport_id].to_i
    end_airport = params[:order][:end_airport].to_i
    @order.email = params[:order][:email]
    @order.return_time_start = end_date
    @order.departure_time_start = start_date
    @order.start_airport_id = start_airport
    @order.end_airport_id = end_airport
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
    @order = Order.find(params[:id])
    @airports = Airport.all
    start_date = DateTime.strptime(params[:order][:departure_time_start], '%m/%d/%Y')
    end_date = DateTime.strptime(params[:order][:return_time_start], '%m/%d/%Y')
    start_airport = params[:order][:start_airport_id].to_i
    end_airport = params[:order][:end_airport].to_i
    @order.email = params[:order][:email]
    @order.return_time_start = end_date
    @order.departure_time_start = start_date
    @order.start_airport_id = start_airport
    @order.end_airport_id = end_airport
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
    params.require(:order).permit(:email, :end_airport, 
                                  :start_airport, :return_time_start, 
                                  :departure_time_start)
  end
end
