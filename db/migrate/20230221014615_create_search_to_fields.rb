class CreateSearchToFields < ActiveRecord::Migration[7.0]
  def change
    create_table :search_to_fields do |t|
      t.references :search, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
