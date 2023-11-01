# spec/models/forecast_spec.rb

require "rails_helper"
require 'pry'
RSpec.describe Forecast, type: :model do
  describe ".fetch_forecast_data" do
    # Define sample address and zip code for testing
    let(:address) { "Saffron Elite, Nallagandla" }
    let(:zip_code) { "500019" }

    context "when forecast data exists" do
      # Create a forecast record in the database using FactoryBot
      let!(:forecast) {  FactoryBot.build(:forecast)  }

      it "returns the forecast data" do
        # Call the fetch_forecast_data method with an existing address and zip code
        create(:forecast, address: address, zip_code: zip_code)
        fetched_data = Forecast.fetch_forecast_data(address, zip_code)
        # Expect it to return the forecast record we created
        expect(fetched_data).to eq(forecast)
      end
    end

    context "when forecast data does not exist" do
      it "returns nil" do
        # Call the fetch_forecast_data method with a nonexistent address and zip code
        fetched_data = Forecast.fetch_forecast_data("Nonexistent Address", "54321")
        # Expect it to return nil because the data doesn't exist
        expect(fetched_data).to be_nil
      end
    end
  end
end
