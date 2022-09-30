class BuildOrder
    attr_reader :first_name, :last_name, :email, :credit_card_number, :showtime_id, :expiration_month, :expiration_year, :child, :adult, :senior, :quantity
    def initialize(params)
        @first_name = params[:first_name]
        @last_name = params[:last_name]
        @email = params[:email]
        @credit_card_number = params[:credit_card_number]
        @expiration_month = params[:expiration_month]
        @expiration_year = params[:expiration_year]
        @showtime_id = params[:showtime_id]
        @child = params[:child].to_i
        @adult = params[:adult].to_i
        @senior = params[:senior].to_i
        @quantity = @child + @adult + @senior 
    end 

    def call #or run
      check_quantity
      update_tickets
      Order.new(first_name: first_name, last_name: last_name, email: email, credit_card_number: credit_card_number, 
        expiration_month: expiration_month, expiration_year: expiration_year, showtime_id: showtime_id)
    end

    private

    def check_quantity
     if quantity <= 0
      raise "You must purchase at least one ticket!"
     end
    end

    def update_tickets
        @showtime = Showtime.find(showtime_id)
        if quantity > @showtime.availability
          raise 'There are not enough tickets to complete your order- please adjust the quantity.'
        else 
          @showtime.update!(availability: @showtime.availability - quantity)
        end
    end

end