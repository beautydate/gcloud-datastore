
module GcloudDatastore

  # This module provides inclusions of all behaviour
  module Composable
    extend ActiveSupport::Concern

    included do
      extend Findable
    end

    include ActiveModel::Model
    include ActiveModel::Serializers::JSON
    include ActiveModel::Serializers::Xml

  end
end
