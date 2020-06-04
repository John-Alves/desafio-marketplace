module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name "#{self.to_s.downcase}-#{Rails.env}"

    def as_indexed_json(**args)
      as_json(except: [:id, :_id])
    end
  end
end