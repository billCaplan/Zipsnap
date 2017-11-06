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

    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode}&APPID=#{apiKey}&units=imperial";
    response = HTTParty.get(url)
    final = response.parsed_response
  end

  def callZomatoLocationCodeApi(name,lat,lng)
    #handle spaces in name

    placeNoSpace = name.split(" ").join("%20");
    url = "https://developers.zomato.com/api/v2.1/locations?query=#{placeNoSpace}&lat=#{lat}&lon=#{lng}"
    response = HTTParty.get(url, headers: {"Accept" => "application/json","User-Key" => "#{ENV["zomato_api_key"]}" })
    zomatoCode = response.parsed_response

    callZomatoLocationApi(zomatoCode)


  end

  def callZomatoLocationApi(zomatoCode)
    #handle spaces in name

    entityID = zomatoCode["location_suggestions"][0]["entity_id"];
    entityType = zomatoCode["location_suggestions"][0]["entity_type"];
    zomatoInfo = callZomatoLocationApi(entityID,entityType)

    url = "https://developers.zomato.com/api/v2.1/location_details?entity_id=#{entity_id}&entity_type=#{entity_type}"
    response = HTTParty.get(url, headers: {"Accept" => "application/json","User-Key" => "#{ENV["zomato_api_key"]}" })
    final = response.parsed_response
  end

  def callTicketmasterApi(zip)
    zipcode = zip;
    apiKey = ENV["ticketmaster_api_key"]

    url = "https://app.ticketmaster.com/discovery/v2/events.json?postalCode=#{zip}&apikey=#{apiKey}";
    response = HTTParty.get(url)
    final = response.parsed_response

    if final["page"]["number"] != 0
      final = final["_embedded"]["events"]
    end

  end


end
