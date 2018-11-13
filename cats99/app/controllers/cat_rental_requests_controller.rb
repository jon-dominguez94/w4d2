class CatRentalRequestsController < ApplicationController
  
  def index
    @requests = CatRentalRequest.all
    render :index
  end
  
  def show
    @request = CatRentalRequest.find(params[:id])
    render :show
  end
end
