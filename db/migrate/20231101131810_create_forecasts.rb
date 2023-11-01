class CreateForecasts < ActiveRecord::Migration[7.1]
  def change
    create_table :forecasts do |t|
      t.string :address
      t.string :zip_code
      t.float :current_temp
      t.float :high_temp
      t.float :low_temp
      t.text :extended_forecast

      t.timestamps
    end
  end
end
