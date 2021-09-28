class AddCompleteNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :complete_name, :string
  end
end
