namespace :clean do
  desc "Clean all data"
  task all: :environment do
    system 'rails db:mongoid:purge'
    system "curl -XDELETE localhost:9200/#{Product.index_name}"
    system "curl -XDELETE localhost:9200/#{Store.index_name}"
    puts ''
  end
end
