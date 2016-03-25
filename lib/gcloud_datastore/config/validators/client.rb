# encoding: utf-8
module GcloudDatastore
  module Config
    module Validators

      # Validator for client configuration.
      module Client
        extend self

        # Standard configuration options.
        STANDARD = [ :project, :keyfile ].freeze

        # Validate the client configuration.
        def validate(clients)
          unless clients.has_key?(:default)
            raise Errors::NoDefaultClient.new(clients.keys)
          end
          clients.each_pair do |name, config|
            validate_client_database(name, config)
            validate_client_hosts(name, config)
            validate_client_uri(name, config)
          end
        end

        private

        def validate_client_project(name, config)
          if no_project?(config)
            raise Errors::NoClientProject.new(name, config)
          end
        end

        def validate_client_keyfile(name, config)
          if no_keyfile?(config)
            raise Errors::NoClientKeyfile.new(name, config)
          end
        end

        # Return true id the configuration has project
        def no_project?(config)
          !config.has_key?(:project)
        end

        # Return true id the configuration has keyfile
        def no_keyfile?(config)
          !config.has_key?(:keyfile)
        end

      end
    end
  end
end
