class CrimeType < ActiveRecord::Base
  has_many :crimes
end
