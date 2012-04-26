class CodesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def codegen
    @cg = Codegen.new(params)
  end

end
