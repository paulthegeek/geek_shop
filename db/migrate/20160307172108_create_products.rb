class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.money :price, null: false
      t.boolean :publish, null: false, default: false
      t.string :short_description, null: false
      t.text :description

      t.timestamps null: false
      t.index :name
      t.index :price
      t.index :publish
    end
  end
end
