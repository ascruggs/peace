# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
fields = nil
FasterCSV.foreach("#{Rails.root}/db/data/crime_types.csv") do |row|
  fields = row and next unless fields
  crime_type = CrimeType.new
  fields.each_with_index do |field, index|
    crime_type.send("#{field}=", row[index])
  end
  crime_type.save!
end
fields = nil
FasterCSV.foreach("#{Rails.root}/db/data/crimes.csv") do |row|
  fields = row and next unless fields
  crime = Crime.new
  fields.each_with_index do |field, index|
    crime.send("#{field}=", row[index])
  end
  crime.save!
end