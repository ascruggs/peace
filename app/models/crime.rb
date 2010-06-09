class Crime < ActiveRecord::Base
  belongs_to :crime_type
  
  def street
    #TODO regex
    self.address.gsub(/^\d+\s?/, '').gsub(/[^a-z0-9 ]/i, '')
  end
  
  
end
