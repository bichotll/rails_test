class Host < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :rooms, :dependent => :destroy
  
  self.per_page = 5
end
