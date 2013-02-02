class ImageSetsController < ApplicationController
  def create
  end

  def delete
  end

  def classify
  end

  def import
  end

  def import_post
    STDERR.puts params.inspect
    redirect_to :action => :import
  end
end
