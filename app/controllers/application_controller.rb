class ApplicationController < ActionController::Base
  before_action :authenticate_store!
end
