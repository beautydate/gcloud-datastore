# encoding: utf-8
module GcloudDatastore
  module Errors

    # This error raised when a client is configured with invalid option
    class InvalidConfigOption < GcloudDatastoreError

      def initialize(name)
        super(compose_message("invalid_config_option", { name: name, options: Config.settings.keys.map(&:inspect).join(", ") }))
      end
    end
  end
end
