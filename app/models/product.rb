class Product
  include Mongoid::Document
  include Searchable

  field :name, type: String
  field :price, type: Float
  field :installment, type: Hash
  field :url, type: String
  belongs_to :store

  mount_uploader :image, ImageUploader, mount_on: :image
end
