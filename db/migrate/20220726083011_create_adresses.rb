class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
