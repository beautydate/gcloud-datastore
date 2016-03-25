# encoding: utf-8
module GcloudDatastore
  module Errors

    # This error raised when a client is configured without keyfile
    class NoEnvironment < GcloudDatastoreError

      def initialize
        super(compose_message("no_environment", {}))
      end
    end
  end
end
