class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :type
      t.string :region
      t.string :marketOpen
      t.string :marketClose
      t.string :timezone
      t.string :currency
      t.float :matchScore

      t.timestamps
    end
  end
end
