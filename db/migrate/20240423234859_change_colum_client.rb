class ChangeColumClient < ActiveRecord::Migration[7.1]
  def change
    change_column :clients, :cpf, :text
  end
end
