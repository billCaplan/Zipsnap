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



  end
end
