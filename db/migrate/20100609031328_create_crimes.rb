class CreateCrimes < ActiveRecord::Migration
  def self.up
    create_table :crimes do |t|
      t.integer :crime_type_id 
      t.string :latitude
      t.string :longitude
      t.string :city
      t.string :address
      t.string :link
      t.datetime :occurred_at

      t.timestamps
    end
  end

  def self.down
    drop_table :crimes
  end
end
