class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :status
      t.string :paypal_order_id

      t.timestamps
    end
  end
end
