class CreateCampains < ActiveRecord::Migration
  def self.up
    create_table :campains do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :campains
  end
end
