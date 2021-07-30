class AddDescriptionToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :description, :string
    ## added a few extra whilst i could think of some
    add_column :cars, :transmission, :string
    add_column :cars, :fuel_type, :string
    add_column :cars, :seats, :integer
  end
end
