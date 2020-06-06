require 'net/http'

namespace :seed_store do
  desc 'Seed stores with API content'
  task run: :environment do
    [
      {
        api_url: 'https://www.fossil.com.br/api/catalog_system/pub/products/search/',
        name: 'Loja Fossil',
        email: 'contato@fossil.com.br',
        site: 'https://www.fossil.com.br'
      },
      # {
      #   api_url: 'http://www.timex.com/api/catalog_system/pub/products/search/',
      #   name: 'Loja Timex',
      #   email: 'contato@timex.com',
      #   site: 'http://www.timex.com'
      # },
      # {
      #   api_url: 'https://www.schumann.com.br/api/catalog_system/pub/products/search/',
      #   name: 'Loja Schumann',
      #   email: 'contato@schumann.com.br',
      #   site: 'https://www.schumann.com.br'
      # }
    ].each { |store| import_store(store) }
  end

  private

  def import_store(data)
    values = data.except(:api_url).merge(password: '123456', password_confirmation: '123456')
    store_model = Store.create(values)

    quantity_of_products = 0
    while quantity_of_products <= 100
      store_products = api_request(data[:api_url], _from: quantity_of_products, _to: quantity_of_products + 49)
      store_products.each do |product_data|
        if quantity_of_products <= 100
          product = import_product(store_model, product_data)
          quantity_of_products += 1 unless product.nil?
        end
      end
    end
  end

  def api_request(url, **params)
    uri = URI(url)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get(uri)
    JSON.parse(response) rescue nil
  end

  def import_product(store, product_data)
    installment = product_data["items"].sample["sellers"].sample["commertialOffer"]["Installments"].sample
    product = Product.new(
      store: store,
      name: product_data["productName"],
      url: product_data["link"],
      price: installment["TotalValuePlusInterestRate"],
      installment: installment,
    )

    image_url = product_data["items"].sample["images"].sample["imageUrl"]
    product.remote_image_url = image_url if image_url.present?

    product.save!
    product
  rescue
    nil
  end
end
