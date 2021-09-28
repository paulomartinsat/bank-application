class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :type
      t.integer :value
      t.timestamps
    end
  end
end
