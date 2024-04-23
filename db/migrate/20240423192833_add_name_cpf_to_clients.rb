class AddNameCpfToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :name, :string
    add_column :clients, :cpf, :integer
  end
end
