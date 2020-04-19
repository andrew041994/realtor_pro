class CreateClientProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :client_properties do |t|
      t.integer :client_id
      t.integer :property_id

      t.timestamps
    end
  end
end
