class ChangeOrderCreditCardType < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :credit_card_number, :string
  end
end
