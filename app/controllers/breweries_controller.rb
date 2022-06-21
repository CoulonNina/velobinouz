class BreweriesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  def index
    @breweries = Brewery.all
  end

  def new
    @brewery = Brewery.new
  end

  def show
    set_brewery
  end

  def create
    @brewery = Brewery.new(params[:brewery])
    @brewery.save
    #redirect_to brewery_path(@brewery)
  end

  def edit
    set_brewery
  end

  def update
    set_brewery
    @brewery.update(params[:brewery])
  end

  def destroy
    set_brewery
    @brewery.destroy
    redirect_to breweries_path, status: :see_other
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :zip, :city, :open_at, :closed_at)
  end

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end
end
