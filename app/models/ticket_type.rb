class TicketType < ApplicationRecord
    enum ticket_type: [ :child, :adult, :senior]
end
