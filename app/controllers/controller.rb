class Controller < ApplicationController
  layout :current_layout

  protected

  def current_layout
    'application'
  end

  def redirect_back_or(url = root_url)
    begin
      redirect_to(:back)
    rescue
      redirect_to(url)
    end
  end
end
