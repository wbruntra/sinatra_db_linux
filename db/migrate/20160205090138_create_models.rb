class CreateModels < ActiveRecord::Migration
  def change
  	create_table :models do |t|
  		t.string :name
  	end
  end
end
