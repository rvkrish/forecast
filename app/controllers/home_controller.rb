class HomeController < ApplicationController
  before_action :verify_cache_set_address

  def index
    # Check if there is a cached forecast for the given zip code
    if @cached_forecast
      @forecast = @cached_forecast
    else
      # If not cached, fetch forecast data for the address and zip code
      forecast_data = Forecast.fetch_forecast_data(@address, @zip_code)

      # Check if forecast data was successfully fetched
      if forecast_data
        # Prepare the forecast data as a JSON-like hash
        @forecast = forcast_json(forecast_data)

        # Cache the forecast data for 30 minutes using the zip code as the key
        Rails.cache.write(@zip_code, @forecast, expires_in: 30.minutes)
      end
    end
  end

  private

  # This method sets the @address and @zip_code based on the parameters
  def verify_cache_set_address
    @address = params[:address]

    # Check if there is a cached forecast for the provided zip code
    if @zip_code
      @cached_forecast = Rails.cache.read(@zip_code)
    end
  end

  # Convert forecast data to a JSON-like hash
  def forcast_json(forecast_data)
    {
      "current_temp" => forecast_data.current_temp,
      "high_temp" => forecast_data.high_temp,
      "low_temp" => forecast_data.low_temp,
      "extended_forecast" => forecast_data.extended_forecast,
    }
  end
end
