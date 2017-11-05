class SnapshotController < ApplicationController
  def index
  end

  def create
    @place = Place.new(snapshot_params)
  end


  def snapshot_params
   params.require(:snapshot).permit(:zip)
 end
end
