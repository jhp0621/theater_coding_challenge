class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|
      t.datetime :start_time
      t.integer :availability
      t.references :movie, null: false, foreign_key: true
      t.references :auditorium, null: false, foreign_key: true
      t.datetime :end_time

      t.timestamps
    end
    add_index :showtimes, :start_time
  end
end
