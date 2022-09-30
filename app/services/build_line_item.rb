class BuildLineItem
  attr_reader :child, :adult, :senior, :order_id
    def initialize(params)
        @adult = params[:adult].to_i
        @child = params[:child].to_i
        @senior = params[:senior].to_i
        @order_id = params[:order_id]
    end

    def call
      ['child', 'adult', 'senior'].map do |cat|
        @ticket_type = TicketType.find_by category: cat
        LineItem.new(order_id: order_id, ticket_type_id: @ticket_type.id, quantity: get_quantity(cat), total_amount: get_total_amount(cat))
      end
    end

    def get_quantity(cat) 
      if cat == 'child' then child
      elsif cat == 'adult' then adult
      else senior
      end
    end

    def get_total_amount(cat)
      @ticket_type = TicketType.find_by category: cat
      get_quantity(cat) * @ticket_type.price
    end

end
