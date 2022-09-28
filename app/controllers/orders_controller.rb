class OrdersController < ApplicationController
  def new
    @order = Order.new
    @showtime = Showtime.find(params[:showtime_id])
  end

  def create
    p "here" 
    p order_params
    @showtime = Showtime.find(order_params[:showtime_id])
    @order = BuildOrder.new(order_params).call()
    if @order.save
      # defaults to show order path
      redirect_to order_path(@order)
    else
      # "new" refers to method above (automatically grabs id from line 9)
      render :new
    end
  rescue => e
    redirect_to new_order_path(showtime_id: @showtime.id), notice: e.message
  end

  def show 
     @order = Order.find(params[:id])
  end

  private

  def order_params
    # question: why am I getting "Unpermitted parameters: :month, :year" error when they are not specified in permit??
    @order_params = params.require(:order).permit(:first_name, :last_name, :email, :credit_card_number, :showtime_id, :quantity)
    @order_params[:expiration_month] = params[:order][:month]
    @order_params[:expiration_year] = params[:order][:year]
    @order_params
  end
end
