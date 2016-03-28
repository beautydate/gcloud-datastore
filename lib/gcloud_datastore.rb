# encoding: utf-8
require "gcloud"
require "active_support"
require "active_model"

require_relative 'gcloud_datastore/document'
require_relative "gcloud_datastore/version"
require_relative "gcloud_datastore/config"
require_relative "gcloud_datastore/clients"

# add english load path by default
I18n.load_path << File.join(File.dirname(__FILE__), "config", "locales", "en.yml")

module GcloudDatastore
  extend self

	# Sets configuration options.
	def configure
		block_given? ? yield(Config) : Config
	end

  def default_client
    Clients.default
  end

  def disconnect_clients
    Clients.disconnect
  end
  
	delegate(*(Config.public_instance_methods(false) << { to: Config }))
end
