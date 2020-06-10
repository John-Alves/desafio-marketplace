FactoryBot.define do
  factory :product do
    association :store
    name { Faker::Name.name }
    url { Faker::Internet.url }
    price { Faker::Number.decimal(l_digits: 2) }

    image {
      Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/logo.jpg')))
    }
  end
end
