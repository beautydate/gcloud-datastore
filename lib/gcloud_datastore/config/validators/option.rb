# encoding: utf-8
module GcloudDatastore
  module Config
    module Validators
      module Option
        extend self

        # Validate a configuration option
        def validate(option)
          unless Config.settings.keys.include?(option.to_sym)
            raise Errors::InvalidConfigOption.new(option)
          end
        end
        
      end
    end
  end
end
