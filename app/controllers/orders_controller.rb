class OrdersController < ApplicationController
  def new
    @order = Order.new
    @showtime = Showtime.find(params[:showtime])
  end
end
