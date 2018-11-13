class CatRentalRequestsController < ApplicationController
  
  def index
    @requests = CatRentalRequest.all
    render :index
  end
  
  def show
    @request = CatRentalRequest.find(params[:id])
    render :show
  end
  
  def new
    @request = CatRentalRequest.new
    render :new
  end
  
  def create
    @request = CatRentalRequest.new(rental_params)
    if @request.save
      redirect_to :cat_rental_request_url(params[:id])
    else
      render json: @request.errors.full_messages, status: 422
    end  
  end
end
