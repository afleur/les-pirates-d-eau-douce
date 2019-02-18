class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :category
      t.integer :price_per_day
      t.text :description
      t.string :picture
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
