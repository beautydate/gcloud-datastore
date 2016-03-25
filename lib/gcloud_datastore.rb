# encoding: utf-8
require "gcloud"
require "active_support"
require "active_model"

require_relative 'gcloud_datastore/document'

require_relative "gcloud_datastore/version"
require_relative "gcloud_datastore/config"

# add english load path by default
I18n.load_path << File.join(File.dirname(__FILE__), "config", "locales", "en.yml")

module GcloudDatastore

	# Sets configuration options.
	def configure
		block_given? ? yield(Config) : Config
	end
  
	# delegate(*(Config.public_instance_methods(false) - [ to: Config ]))
end
