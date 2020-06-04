class HomeController < ActionController::Base
  layout 'unauthenticated'
  def index
    @products = Product.search("*#{params[:query]}*").records.records
  end
end
