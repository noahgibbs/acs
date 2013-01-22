class ApplicationController < ActionController::Base
  protect_from_forgery
  include ActiveModel::ForbiddenAttributesProtection  # TODO: remove for Rails 4.0+

  def default_world
    World.where(:is_default => true).first
  end

  def implementors_only!
    # Soon, redirect non-implementors
  end

  def authors_only!
    # Soon, redirect non-authors
  end
end
