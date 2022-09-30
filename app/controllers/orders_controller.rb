class OrdersController < ApplicationController
  def new
    @order = Order.new
    @showtime = Showtime.find(params[:showtime_id])
    @ticket_types = TicketType.all
  end

  def create
    @showtime = Showtime.find(order_params[:showtime_id])
    @order = BuildOrder.new(order_params).call()
    if @order.save
      @line_items_params = params.require(:order).permit(:adult, :child, :senior).merge({order_id: @order.id})
      @line_items = BuildLineItem.new(@line_items_params).call.select { |i| i.quantity.to_i > 0 }
      @line_items.each do |i| i.save!
      @order_total_amount = @line_items.map { |i| i.total_amount }.reduce(:+)
      # @order_total_amount = @line_items.reduce { |sum, item| sum + item.total_amount }
      @order.update!(total_amount: @order_total_amount)
      end
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
     @line_items = LineItem.where("order_id = #{@order.id}")
  end

  private

  def order_params
    # question: why am I getting "Unpermitted parameters: :month, :year" error when they are not specified in permit??
    params.require(:order).permit(:first_name, :last_name, :email, :credit_card_number, :expiration_month, :expiration_year, :showtime_id, :adult, :child, :senior)
  end
end
