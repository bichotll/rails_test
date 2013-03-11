class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id
  
  belongs_to :host, :foreign_key => 'host_id'
  has_many :booking
  
  self.per_page = 5
  
  
#  select * from rooms
#  INNER JOIN hosts ON rooms.host_id = hosts.id
#  left join bookings on bookings.room_id = rooms.id
#  where rooms.id not in
#  (
#  select rooms.id from bookings
#  inner join rooms on bookings.room_id = rooms.id
#  where 1
#  and start_date >= "2013-06-01" and end_date <= "2013-06-07"
#  and (rooms.capacity - bookings.number_of_guests) < 1
#  group by room_id
#  )
  
  def self.search_availability(start_date, end_date, guests)
    select('*').joins("left join bookings on bookings.room_id = rooms.id").joins(:host).where('rooms.id not in (?)', Booking.select('rooms.id').joins(:room).where('start_date >= ?', "#{start_date}").where('end_date <= ?', "#{end_date}").where('rooms.capacity - bookings.number_of_guests < ?', "#{guests}").group('room_id'))
  end
end
