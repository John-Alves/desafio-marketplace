class Store
  include Mongoid::Document
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_update do
    unless valid?
      if errors.messages[:password_confirmation].present? || errors.messages[:password].present?
        self.password_confirmation = nil
        self.password = nil
      end
    end
  end

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  has_many :products, dependent: :destroy
  field :name, type: String
  field :site, type: String

  mount_uploader :image, ImageUploader, mount_on: :image

  def verify(teste)
    self.valid_password?(teste)
  end
end
