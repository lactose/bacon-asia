class Controller < ApplicationController
  layout :current_layout

  protected

  def current_layout
    'application'
  end
end
