class Order < ApplicationRecord
  belongs_to :showtime
  has_many :line_items, dependent: :destroy
end
