class HomeController < ActionController::Base
  layout 'marketplace'
  def index
    search_result = Product.search("*#{params[:query]}*")
    @products = search_result.records.records
    @quantity = search_result.count
  end
end
