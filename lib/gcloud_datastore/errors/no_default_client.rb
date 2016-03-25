# encoding: utf-8
module GcloudDatastore
  module Errors

    # This error raised when a client is configured without keyfile
    class NoDefaultClient < GcloudDatastoreError

      def initialize(keys)
        super(
          compose_message(
            "no_default_client",
            { keys: keys.join(", ")}
          )
        )
      end
    end
  end
end
