class AddFieldsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :origin_wallet_id, :integer
    add_column :transactions, :destination_walllet_id, :integer
  end
end
