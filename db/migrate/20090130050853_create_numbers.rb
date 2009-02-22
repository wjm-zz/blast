class CreateNumbers < ActiveRecord::Migration
  def self.up
    create_table :numbers do |t|
      t.integer :number
      t.integer :campaign_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :numbers
  end
end
