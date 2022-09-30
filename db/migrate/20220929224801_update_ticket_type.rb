class UpdateTicketType < ActiveRecord::Migration[6.1]
  def change
    remove_column :ticket_types, :ticket_type, :string
    add_column :ticket_types, :category, :string
  end
end
