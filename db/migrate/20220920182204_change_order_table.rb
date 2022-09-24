class ChangeOrderTable < ActiveRecord::Migration[6.1]
  def change
     remove_column :orders, :payment_token, :string
     add_column :orders, :credit_card_number, :integer
     add_column :orders, :expiration_month, :integer
     add_column :orders, :expiration_year, :integer
  end
end
