# spec/controllers/home_controller_spec.rb
require 'pry'
# Include Rails helper for the controller tests
require 'rails_helper'

# Describe the HomeController controller and specify it's of type controller
RSpec.describe HomeController, type: :controller do
  # Describe the 'GET #index' action
  describe 'GET #index' do
    # Define some variables for reuse in the tests
    let(:zip_code) { '500019' }
    let(:address) { 'Saffron Elite, Nallagandla' }

    # Context: when forecast data is cached
    context 'when forecast data is cached' do
      # Create a sample forecast data using FactoryBot
      let(:forecast_data) { FactoryBot.build(:forecast) }

      # Before running the tests in this context
      before do
        # Mock the 'read' method of the Rails cache to return the cached forecast data
        allow(Rails.cache).to receive(:read).with(zip_code).and_return(forecast_data)
        # Send a GET request to the 'index' action with the zip code parameter
        get :index, params: { zipcode: zip_code }
      end

      # Test: it assigns @forecast with cached data
      it 'assigns @forecast with cached data' do
        expect(assigns(:forecast)).to eq(forecast_data)
      end

      # Test: it renders the index template
      it 'renders the index template' do
        expect(response).to render_template('index')
      end
    end

    # Context: when forecast data is not cached
    context 'when forecast data is not cached' do
      # Create a sample forecast data using FactoryBot
      let(:forecast_data) { FactoryBot.build(:forecast) }
      let(:zip_code) { '500019' }
      # Before running the tests in this context
      before do
        # Mock the 'read' method of the Rails cache to return nil (not cached)
        allow(Rails.cache).to receive(:read).with(zip_code).and_return(nil)

        allow(Rails.cache).to receive(:write)
        # Mock the 'fetch_forecast_data' method of the Forecast model to return the sample forecast data
        allow(Forecast).to receive(:fetch_forecast_data).and_return(forecast_data)
        # Send a GET request to the 'index' action with the zip code and address parameters
        get :index, params: { zipcode: zip_code, address: address }
      end

      # Test: it assigns @forecast with fetched data
      it 'assigns @forecast with fetched data' do
        expect(assigns(:forecast)).to eq( controller.send(:forcast_json, forecast_data))
      end

      # Test: it caches the forecast data for 30 minutes
      it 'caches the forecast data for 30 minutes' do
        expect(Rails.cache).to have_received(:write).with(zip_code, controller.send(:forcast_json, forecast_data), expires_in: 30.minutes)
      end

      # Test: it renders the index template
      it 'renders the index template' do
        expect(response).to render_template('index')
      end
    end
  end

  # Describe the private method 'verify_cache_set_address'
  describe 'private #verify_cache_set_address' do
    # Context: when zipcode is provided
    context 'when zipcode is provided' do
      # Define a sample zip code
      let(:zip_code) { '500019' }

      # Before running the tests in this context
      before do
         # Mock the 'read' method of the Rails cache to return nil (not cached)
         allow(Rails.cache).to receive(:read).with(zip_code).and_return(nil)
        # Set the 'zipcode' parameter in the controller to the sample zip code
        controller.params[:zipcode] = zip_code
        # Call the 'verify_cache_set_address' method in the controller
        controller.send(:verify_cache_set_address)
      end

      # Test: it assigns @zip_code
      it 'assigns @zip_code' do
        expect(assigns(:zip_code)).to eq(zip_code)
      end

      # Test: it checks for cached forecast data
      it 'checks for cached forecast data' do
        expect(Rails.cache).to have_received(:read).with(zip_code)
      end
    end

    # Context: when zipcode is not provided
    context 'when zipcode is not provided' do
      # Before running the tests in this context
      before do
        # Call the 'verify_cache_set_address' method in the controller without setting 'zipcode'
        controller.send(:verify_cache_set_address)
      end

      # Test: it does not assign @zip_code
      it 'does not assign @zip_code' do
        expect(assigns(:zip_code)).to be_nil
      end

    end
  end
end
