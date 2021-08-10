class AddCountyToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :county, :string
  end
end
