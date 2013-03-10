class Booking < ActiveRecord::Base
  attr_accessible :end_date, :number_of_guests, :room_id, :start_date

  belongs_to :room, :foreign_key => 'room_ref'
end
