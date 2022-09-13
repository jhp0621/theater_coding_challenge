class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :total_amount, scale:2, precision:10
      t.string :payment_token
      t.references :showtime, null: false, foreign_key: true

      t.timestamps
    end   
    add_index :orders, :email
    add_index :orders, :payment_token
  end
end
