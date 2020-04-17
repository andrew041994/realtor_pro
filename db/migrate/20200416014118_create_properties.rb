class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :price
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
