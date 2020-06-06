class HomeController < ActionController::Base
  layout 'marketplace'
  before_action :get_stores, only: [:index]
  before_action :get_products, only: [:index]

  def index
  end

  private

  def get_products
    @products = Product.search("*#{params[:query]}*").records.records

    if params[:min_price].present?
      @products = @products.where(:price.gte => params[:min_price])
    end
    if params[:max_price].present?
      @products = @products.where(:price.lte => params[:max_price])
    end
    if params[:stores].present?
      @products = @products.in(store: params[:stores])
    end

    @quantity = @products.count
  end

  def get_stores
    @stores = Store.search("*").records.records
  end
end
