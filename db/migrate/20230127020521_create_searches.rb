class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
