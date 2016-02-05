class AddDescriptionToModels < ActiveRecord::Migration
  def change
    add_column :models, :description, :string
  end
end
