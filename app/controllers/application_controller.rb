class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery 

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def raise_404
    raise ActionController::RoutingError.new('Not Found')
  end

end
