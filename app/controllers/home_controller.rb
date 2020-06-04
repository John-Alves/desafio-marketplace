class HomeController < ActionController::Base
  layout 'unauthenticated'
  def index
    @products = Product.all
  end
end
