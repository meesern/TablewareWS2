class OffersController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def update  
    @offer = Offer.find(params[:id])
    @offer.image = params[:image]
    hobo_update(@offer)
  end

end
