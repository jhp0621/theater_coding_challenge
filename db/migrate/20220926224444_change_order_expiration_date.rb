class ChangeOrderExpirationDate < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :expiration_month, :integer
    remove_column :orders, :expiration_year, :integer
    add_column :orders, :expiration_date, :string
  end
end
