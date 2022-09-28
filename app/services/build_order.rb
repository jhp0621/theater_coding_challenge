class BuildOrder
    attr_reader :first_name, :last_name, :email, :credit_card_number, :quantity, :showtime_id, :expiration_month, :expiration_year
    def initialize(params)
        @first_name = params[:first_name]
        @last_name = params[:last_name]
        @email = params[:email]
        @credit_card_number = params[:credit_card_number]
        @expiration_month = params[:expiration_month]
        @expiration_year = params[:expiration_year]
        @quantity = params[:quantity]
        @showtime_id = params[:showtime_id]
    end

    def call #or run
      update_tickets
      Order.new(first_name: first_name, last_name: last_name, email: email, credit_card_number: credit_card_number, 
        expiration_month: expiration_month, expiration_year: expiration_year, showtime_id: showtime_id, total_amount: get_total_amount)
    end

    private

    def get_total_amount
        quantity * 5
    end 

    def update_tickets
        @showtime = Showtime.find(showtime_id)
        if quantity.to_i > @showtime.availability
          raise 'Not enough tickets'
        else 
          @showtime.update!(availability:  @showtime.availability - quantity.to_i)
        end
    end

end