class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id
  
  belongs_to :host, :foreign_key => 'host_ref'
  has_many :booking
end
