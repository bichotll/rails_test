class Host < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :rooms, :dependent => :destroy
end
