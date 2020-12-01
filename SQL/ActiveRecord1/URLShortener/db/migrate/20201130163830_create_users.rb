class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    end
    add_column :users, :email , :string
    add_index :users, :email, unique: true
  end
end
