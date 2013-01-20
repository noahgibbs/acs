class ApplicationController < ActionController::Base
  protect_from_forgery
  include ActiveModel::ForbiddenAttributesProtection  # TODO: remove for Rails 4.0+

  def implementors_only!
    # Soon, redirect non-implementors
  end
end
