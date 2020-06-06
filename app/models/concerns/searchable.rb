module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name "#{self.to_s.downcase}-#{Rails.env}"

    def self.search(query)
      __elasticsearch__.search(query, size: 1000)
    end

    def as_indexed_json(**args)
      as_json(except: [:id, :_id])
    end
  end
end