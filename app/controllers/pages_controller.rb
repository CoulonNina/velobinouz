class PagesController < ApplicationController
  
  def home
    @last_breweries = Brewery.all.last(4)
  end
  
end
