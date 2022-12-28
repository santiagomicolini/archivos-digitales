class AddColumnsToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :description, :text
    add_column :documents, :agency, :string
    add_column :documents, :tax_name, :string
    add_column :documents, :date, :date
    add_reference :documents, :client, foreign_key: true
  end
end
