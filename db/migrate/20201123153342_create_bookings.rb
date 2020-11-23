class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :influencer, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true
      t.string :status
      t.text :contract
      t.integer :total_price

      t.timestamps
    end
  end
end
