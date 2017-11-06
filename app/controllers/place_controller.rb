class PlaceController < ApplicationController

  include PlaceHelper
  def new

  end

  def index
    @zipCode = params[:zipCode]

    #Calls ZipCodeApi.com
    zipCodeInfo = callZipCodeApi(@zipCode)

    @latitude = zipCodeInfo["lat"]
    @longitude = zipCodeInfo["lng"]
    @cityName = zipCodeInfo["city"]
    @usaState = zipCodeInfo["state"]

    #calls Weather
    @weatherInfo = callWeatherApi(@zipCode)
    #if weatherInfo
    #  @currentTemperature = weatherInfo["main"]["temp"]
    #  @currentMinTemperature = weatherInfo["main"]["temp_min"]
    #  @currentMaxTemperature = weatherInfo["main"]["temp_max"]
  #  end

    #calls Zomato Api
    @zomatoInfo = callZomatoLocationCodeApi(@cityName, @latitude, @longitude)

    #entityID = zomatoCode["location_suggestions"][0]["entity_id"];
  #  entityType = zomatoCode["location_suggestions"][0]["entity_type"];
    #zomatoInfo = callZomatoLocationApi(entityID,entityType)

    #@topCuisines = zomatoInfo["top_cuisines"]

    #@bestRatedRestaurant = zomatoInfo["best_rated_restaurant"]



    #calls Ticketmaster api

    @ticketmasterEventsList = callTicketmasterApi(@zipCode)


  end
end
