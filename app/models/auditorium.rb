class Auditorium < ApplicationRecord
    has_many :showtimes, dependent: :destroy
end
