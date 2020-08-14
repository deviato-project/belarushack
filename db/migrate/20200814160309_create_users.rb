class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_type_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :contact, null: false
      t.string :surname
      t.string :title
      t.string :description
      t.text :funding_reason, null: false
      t.monetize :funding_amount
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
