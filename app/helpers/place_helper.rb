require 'httparty'
module PlaceHelper
  def callZipCodeApi(zip)
      zipcode = zip;
      apiKey = ENV["zip_code_api_key"]

      url =  "https://www.zipcodeapi.com/rest/#{apiKey}/info.json/#{zipcode}/degrees";
      response = HTTParty.get(url)
      final = response.parsed_response


  end

  def callWeatherApi(zip)
    zipcode = zip;
    apiKey = ENV["weather_api_key"]

    url = "http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode}&APPID=#{apikey}"
  end
end
