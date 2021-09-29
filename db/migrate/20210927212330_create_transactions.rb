class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :mode
      t.integer :value
      t.timestamps
    end
  end
end
