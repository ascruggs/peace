class CreateCrimeTypes < ActiveRecord::Migration
  def self.up
    create_table :crime_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :crime_types
  end
end
