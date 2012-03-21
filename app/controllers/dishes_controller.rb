class DishesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def update  
    @dish = Dish.find(params[:id])
    @dish.image = params[:image]
    hobo_update(@dish)
  end

end
