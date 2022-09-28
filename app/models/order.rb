class Order < ApplicationRecord
  belongs_to :showtime
  has_many :line_items, dependent: :destroy
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :credit_card_number, presence: true, format: { with: /\d/ }, length: { minimum: 15, maximum: 16 }
  validates :expiration_month, presence: true, length: { minimum: 2, maximum: 2 }
  validates :expiration_year, presence: true, length: { minimum: 2, maximum: 2 }
end
