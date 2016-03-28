# encoding: utf-8
require "gcloud_datastore/config/environment"
require "gcloud_datastore/config/options"
require "gcloud_datastore/config/validators"

module GcloudDatastore

  # This module defines all the configuration options.
  module Config
    extend self
    extend Options

    LOCK = Mutex.new

    option :preload_models, default: false
    option :raise_not_found_error, default: true
    option :use_utc, default: false

    # Gcloud Datastore has been configured?
    def configured?
      clients.key?(:default)
    end

    # Connect to Datastore
    def connect_to(project, keyfile, options = {})
      self.clients = {
        default: {
          project: project,
          keyfile: nil,
          options: options
        }
      }
    end

    def load!(path, environment = nil)
      settings = Environment.load_yaml(path, environment)
      if settings.present?
        Clients.disconnect
        Clients.clear
        load_configuration(settings)
      end
      settings
    end

    # Get all the models in the application.
    def models
      @models ||= []
    end

    # Register a model in the application.
    def register_model(klass)
      LOCK.synchronize do
        models.push(klass) unless models.include?(klass)
      end
    end

    # Load all the configuration.
    def load_configuration(settings)
      configuration = settings.with_indifferent_access
      self.options = configuration[:options]
      self.clients = configuration[:clients]
    end

    # Set the configuration options.
    def options=(options)
      if options
        options.each_pair do |option, value|
          Validators::Option.validate(option)
          send("#{option}=", value)
        end
      end
    end

    # Get the client configuration.
    def clients
      @clients ||= {}
    end

    private

    def clients=(clients)
      raise Errors::NoClientsConfig.new unless clients
      c = clients.with_indifferent_access
      Validators::Client.validate(c)
      @clients = c
    end
  end
end
