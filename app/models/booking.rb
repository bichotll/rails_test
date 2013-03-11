class Booking < ActiveRecord::Base
  attr_accessible :end_date, :number_of_guests, :room_id, :start_date

  belongs_to :room, :foreign_key => 'room_id'
  
  self.per_page = 5
end
