class ChangeExpirationColumn < ActiveRecord::Migration[6.1]
  def change
     remove_column :orders, :expiration_date, :string
    add_column :orders, :expiration_month, :string
    add_column :orders, :expiration_year, :string
  end
end
