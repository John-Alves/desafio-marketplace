class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :installments, type: Integer
  field :url, type: String
  belongs_to :store

  mount_uploader :image, ImageUploader, mount_on: :image
end
