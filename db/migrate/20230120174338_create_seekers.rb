class CreateSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :seekers do |t|
      t.string :username
      t.float :latitude
      t.float :longitude
      t.boolean :status

      t.timestamps
    end
  end
end
