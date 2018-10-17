class CreateDailyEuroExRates < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_euro_ex_rates do |t|
      t.string :time
      t.string :currency
      t.string :rate

      t.timestamps
    end
  end
end
