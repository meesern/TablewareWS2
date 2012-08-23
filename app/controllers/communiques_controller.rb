class CommuniquesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    hobo_index :per_page => 30, :order=>"created_at desc"
    respond_to do |format|
      format.html 
      format.js
    end
  end

  web_method :acknowledge do
    @communique.acknowledge
    redirect_to :action=>'index'
  end

end
