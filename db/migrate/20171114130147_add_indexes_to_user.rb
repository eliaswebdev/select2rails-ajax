class AddIndexesToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :name
    add_index :users, :email
    add_index :users, :cpf    
  end
end
