class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
