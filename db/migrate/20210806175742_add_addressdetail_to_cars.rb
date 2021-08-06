class AddAddressdetailToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :house_num, :string
    add_column :cars, :street, :string
    add_column :cars, :city, :string
    add_column :cars, :town, :string
    add_column :cars, :postal_code, :string
    add_column :cars, :country, :string
  end
end
