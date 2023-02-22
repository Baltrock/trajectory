class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :creator
      t.references :search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
