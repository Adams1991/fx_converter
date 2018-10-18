class CreateExchangeRates < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_rates do |t|
      t.string :time
      t.text :currency
      t.string :rate

      t.timestamps
    end
  end
end
