class Forecast < ApplicationRecord
    def self.fetch_forecast_data(address,zip_code)
        #Here we can have a service to fetch the forecast
        Forecast.find_by(address: address, zip_code: zip_code)
    end
end
