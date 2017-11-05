class WelcomeController < ApplicationController
  def index
  end

  def newPlace
    @zipCode = params[:zipCode]

    redirect_to place_index_url(:zipCode => @zipCode)

  end
end
