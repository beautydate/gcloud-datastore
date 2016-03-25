# encoding: utf-8
module GcloudDatastore
  module Errors

    # This error raised when a client is configured without keyfile
    class NoClientKeyfile < GcloudDatastoreError

      def initialize
        super( compose_message( "no_clients_config", {}) )
      end
    end
  end
end
