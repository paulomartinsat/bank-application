class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.decimal :balance, default: 100
      t.string :history

      t.timestamps
    end
  end
end
