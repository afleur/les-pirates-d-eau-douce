class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :boat, foreign_key: true
      t.date :checkindate
      t.date :checkoutdate

      t.timestamps
    end
  end
end
