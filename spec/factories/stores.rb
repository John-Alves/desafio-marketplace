FactoryBot.define do
  factory :store do
    name { Faker::Name.name }
    image {
      Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/logo.jpg')))
    }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
