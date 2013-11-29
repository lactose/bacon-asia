class ApplicationController < ActionController::Base
  include AuthenticationController

  protect_from_forgery with: :exception
end
