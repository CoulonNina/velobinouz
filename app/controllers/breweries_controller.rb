class BreweriesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  def index
    @breweries = policy_scope(Buddy)
  end

  def new
    @user = current_user
    #@buddy.user = current_user
    @brewery = Brewery.new
    authorize @breweries
  end

  def show
    @brewery = Brewery.find(params[:id])
    authorize @brewery
    #@booking = Booking.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    @brewery.user = current_user
    authorize @brewery
    if @brewery.save
      redirect_to brewery_path(@brewery)
    else
      render :new, status: :unprocessable_entity
    end
  end

  #def update
  #  authorize @buddy
  #  @buddy = Buddy.find(params[:id])
  #  @buddy.update(buddy_params)
  #  redirect_to buddy_path(@buddy)
  #end

  def edit
    @brewery = Brewery.find(params[:id])
    authorize @brewery
    #@buddy = Buddy.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.user = current_user
    authorize @brewery
    if @brewery.update(brewery_params)
      redirect_to brewery_path(@buddy)
    else
      render :edit
    end
  end

  def destroy
    @brewery = Brewery.find(params[:id])
    authorize @brewery
    @brewery.destroy
    redirect_to breweries_path, status: :see_other
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :ZIP_codes, :city, :open_at, :closed_at)
  end

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end
end
