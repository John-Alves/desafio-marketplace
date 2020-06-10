class Product
  include Mongoid::Document
  include Searchable

  validates_presence_of :name, :price, :url, :store

  field :name, type: String
  field :price, type: Float
  field :installment, type: Hash
  field :url, type: String
  belongs_to :store

  mount_uploader :image, ImageUploader, mount_on: :image
end
