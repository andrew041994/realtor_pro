class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
