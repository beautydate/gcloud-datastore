# encoding: utf-8
module GcloudDatastore
  module Errors

    # This error raised when a client is configured without config
    class NoClientConfig < GcloudDatastoreError

      def initialize(name)
        super(compose_message("no_client_config", { keys: name }))
      end
    end
  end
end
