class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def show
    @address = params[:address]
  end

  def index

  end

end
