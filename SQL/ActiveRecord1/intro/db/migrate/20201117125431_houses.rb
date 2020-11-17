class Houses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :adress
    end
  end
end
