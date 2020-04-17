class CreateUserClients < ActiveRecord::Migration[6.0]
  def change
    create_table :user_clients do |t|
      t.belongs_to :user
      t.belongs_to :client
      t.timestamps
    end
  end
end
