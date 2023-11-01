FactoryBot.define do
  factory :forecast do
    id {1}
    address { "Saffron Elite, Nallagandla" }
    current_temp { 72.0 }
    high_temp { 80.0 }
    low_temp { 65.0 }
    extended_forecast { "Sunny day" }
    zip_code {"500019"}
  end
  factory :forcast_json, class: Hash do
    initialize_with { {"current_temp"=>72.0, "extended_forecast"=>"Sunny day", "high_temp"=>80.0, "low_temp"=>65.0} }
  end
end
