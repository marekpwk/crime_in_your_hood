class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
      t.string :position
      t.string :department
  		t.integer :salary

      t.timestamps

  	end
  end
end
