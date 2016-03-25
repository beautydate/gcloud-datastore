# encoding: utf-8
module GcloudDatastore
  module Errors

    # This error raised when a client is configured without keyfile
    class NoClientKeyfile < GcloudDatastoreError

      def initialize(name, config)
        super(
          compose_message(
            "no_client_keyfile",
            { name: name, config: config}
          )
        )
      end
    end
  end
end
