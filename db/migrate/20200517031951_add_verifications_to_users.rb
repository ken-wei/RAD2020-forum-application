class AddVerificationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cardtype, :string
    add_column :users, :cardno, :string
  end
end
