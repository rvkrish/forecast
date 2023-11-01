json.extract! forecast, :id, :address, :zip_code, :current_temp, :high_temp, :low_temp, :extended_forecast, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)
