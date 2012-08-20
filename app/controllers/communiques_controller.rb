class CommuniquesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    hobo_index
    respond_to do |format|
      format.html 
      format.js
    end
  end

end
