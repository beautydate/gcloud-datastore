# encoding: utf-8

module GcloudDatastore
  module Clients
    module Factory
      extend self

      def create(name = nil)
        return default unless name
        config = GcloudDatastore.clients[name]
        raise Errors::NoClientConfig.new(name) unless config
        create_client(config)
      end

      def default
        create_client(GcloudDatastore.clients[:default])
      end

      private

      def create_client(configuration)
        raise Errors::NoClientsConfig.new unless configuration
        if configuration[:project]
          Gcloud.new configuration[:project], configuration[:keyfile]
          Gcloud.datastore( configuration[:project] )
        end
      end
    end
  end
end
