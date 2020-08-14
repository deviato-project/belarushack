class CreateUserTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_types do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :title_ru, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end
