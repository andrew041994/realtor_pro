class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.float :price
      t.boolean :sold

      t.timestamps
    end
  end
end
