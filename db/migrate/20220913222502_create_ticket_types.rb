class CreateTicketTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_types do |t|
      t.string :ticket_type
      t.decimal :price, scale:2, precision:10

      t.timestamps
    end
  end
end
