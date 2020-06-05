ENV['ELASTICSEARCH_URL'] ||= ENV['BONSAI_URL'] || 'http://localhost:9200/'

unless Store.__elasticsearch__.index_exists?
  Store.__elasticsearch__.create_index! force: true
  Store.import
end

unless Product.__elasticsearch__.index_exists?
  Product.__elasticsearch__.create_index! force: true
  Product.import
end