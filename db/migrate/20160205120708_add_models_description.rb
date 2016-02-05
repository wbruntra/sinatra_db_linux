class AddModelsDescription < ActiveRecord::Migration
  def up
    Model.all.each do |m|
      m.update_attribute :description, 'This is a generic description'
    end
  end
end
