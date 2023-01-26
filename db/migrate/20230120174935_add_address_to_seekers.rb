class AddAddressToSeekers < ActiveRecord::Migration[7.0]
  def change
    add_column :seekers, :address, :string
  end
end
