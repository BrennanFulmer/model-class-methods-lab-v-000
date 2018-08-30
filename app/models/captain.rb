
class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    joins(boats: :classifications).where(classifications: {name: "Catamaran"})
  end
  
  def self.sailors
    joins(boats: :classifications).where(classifications: {name: "Sailboat"}).distinct
  end
  
  def self.talented_seafarers
    where("id IN (?)", self.sailors.pluck(:id) & self.motorboats.pluck(:id)) 
  end
  
  def self.non_sailors
binding.pry
  end
  
end
