class HomeController < ActionController::Base
  layout 'marketplace'
  before_action :get_stores, only: [:index]

  def index
    search_result = Product.search("*#{params[:query]}*")
    @products = search_result.records.records
    @quantity = search_result.count
  end

  private

  def get_stores
    @stores = Store.search("*").records.records
  end
end
