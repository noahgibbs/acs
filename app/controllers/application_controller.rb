class ApplicationController < ActionController::Base
  protect_from_forgery

  def implementors_only!
    # Soon, redirect non-implementors
  end
end
