class CatRentalRequestsController < ApplicationController
  
  def index
    @requests = CatRentalRequest.all
    render :index
  end
end
