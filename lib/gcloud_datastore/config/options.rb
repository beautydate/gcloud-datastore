# encoding: utf-8
module GcloudDatastore
	module Config
		module Options

			# Get the defaults.
			def defaults
        @defaults ||= {}
      end

      # Define a configuration option.
      def option(name, options = {})
        defaults[name] = settings[name] = options[:default]

        class_eval <<-RUBY
          def #{name}
            settings[#{name.inspect}]
          end

          def #{name}=(value)
            settings[#{name.inspect}] = value
          end

          def #{name}?
            #{name}
          end
        RUBY
      end

      # Reset the configuration option to the default.
      def reset
        settings.replace(defaults)
      end

      # Get settings.
      def settings
        @settings ||= {}
      end
			
		end
	end
end
