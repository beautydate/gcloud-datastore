# encoding: utf-8
module GcloudDatastore
	module Config

		# Getting environment information.
		module Environment
			extend self

			# Get the name of the environment.
			def env_name
				return Rails.env if defined?(Rails) && Rails.respond_to?(:env)
        return Sinatra::Base.environment.to_s if defined?(Sinatra)
        ENV["RACK_ENV"] || ENV["GCLOUDDATASTORE_ENV"] || raise(Errors::NoEnvironment.new)
			end

			# Load the yaml.
			def load_yaml(path, environment = nil)
				env = environment ? environment.to_s : env_name
				YAML.load(ERB.new(File.new(path).read).result)[env]
			end
		end
	end
end
