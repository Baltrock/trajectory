class CreateUserToParties < ActiveRecord::Migration[7.0]
  def change
    create_table :user_to_parties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
