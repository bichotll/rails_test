require 'csv' 





namespace :import do
  
  
  desc "import hosts csv"
  task :hosts => :environment do
    puts "importing hosts..."
    
    #"ref", "name", "address"

    i = -1
    CSV.open('db/import_csv/hosts-2000.csv', 'r') do |row|
      if i != -1
        row[0]['host#'] = ''
        @host = Host.new
        @host.id = row[0]
        @host.name = row[1]
        @host.address = row[2]
        @host.save
        print '.'
      end
      i += 1
    end
    
    puts "\n---"
    puts "\n\n#{i} new hosts"
    
  end


  
  desc "import rooms csv"
  task :rooms => :environment do
    puts "importing rooms..."
    
    #"ref", "host_ref", "capacity"
    
    i = -1    
    CSV.open('db/import_csv/rooms-2000.csv', 'r') do |row|
      if i != -1      
        row[0]['room#'] = ''
        row[1]['host#'] = ''
        @room = Room.new
        @room.id = row[0]
        @room.host_id = row[1]
        @room.capacity = row[2]
        @room.save!
        print '.'
      end
      i += 1
    end
    
    puts "\n---"
    puts "\n\n#{i} new rooms"
    
  end


  
  desc "import bookings csv"
  task :bookings => :environment do
    puts "importing bookings..."
    
    #"ref", "room_ref", "start_date", "end_date", "number_of_guests"
    
    i = -1
    CSV.open('db/import_csv/bookings-2000.csv', 'r') do |row|
      if i != -1
        row[0]['b#'] = ''
        row[1]['room#'] = ''
        @booking = Booking.new 
        @booking.id = row[0]
        @booking.room_id = row[1]
        @booking.start_date = row[2]
        @booking.end_date = row[3]
        @booking.number_of_guests = row[4]
        @booking.save!
        print '.'
      end
      i += 1
    end
    
    puts "\n---"
    puts "\n\n#{i} new bookings"
    
  end
  
  
  
  desc "truncate tables"
  task :trun => :environment do
    Host.delete_all
    Room.delete_all
    Booking.delete_all
    
    p 'Truncated'
  end
  
  
  
  
end