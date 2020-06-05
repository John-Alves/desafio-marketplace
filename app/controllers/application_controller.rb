class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_store!

  private

  def layout_by_resource
    if devise_controller?
      "unauthenticated"
    else
      "application"
    end
  end
end
