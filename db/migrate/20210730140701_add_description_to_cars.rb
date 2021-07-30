class AddDescriptionToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :description, :string, :after => :reg_number
    add_column :cars, :transmission, :string
    add_column :cars, :fuel_type, :string
    add_column :cars, :seats, :integer
  end
end
