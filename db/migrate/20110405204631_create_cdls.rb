class CreateCdls < ActiveRecord::Migration
  def self.up
    create_table :cdls do |t|
      t.string  "name"
      t.integer "position"
      t.boolean "physical", :default => false
      t.boolean "general_knowledge", :default => false
      t.boolean "air_brakes", :default => false
      t.boolean "passenger", :default => false
      t.boolean "school", :default => false
      t.boolean "skills_test", :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :cdls
  end
end
