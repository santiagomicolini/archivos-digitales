class AddColumnsToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :name, :string
    add_column :clients, :cuit, :integer
    add_column :clients, :domicilio, :string
  end
end
