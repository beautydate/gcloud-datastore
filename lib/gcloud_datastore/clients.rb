# encoding: utf-8
require "gcloud_datastore/clients/factory"

module GcloudDatastore
  module Clients
    extend ActiveSupport::Concern
    # StorageOptions
    # ThreadOptions
    # Options

    class << self
      def clear
        clients.clear
      end

      def default
        clients[:default] ||= Clients::Factory.default
      end

      def disconnect
        clients.values.each {|client| client.close }
      end

      def with_name(name)
        clients[name.to_sym] ||= Clients::Factory.create(name)
      end

      def set(name, client)
        clients[name.to_sym] = client
      end

      def clients
        @clients||= {}
      end
    end

    def collection
      datastore_client[collection_name]
    end

    def datastore_client
      super || self.class.datastore_client
    end

    def collection_name
      super || self.clas.collection.name
    end

    module ClassMethods

      def datastore_client
        return client_with_options if client_with_options
        client = Clients.with_name(client_name)
        opts = self.persistence_options ? self.persistence_options.dup : {}
        if defined?(GcloudDatastore::Client::VALID_OPTIONS)
          opts.reject! { |k,v| !GcloudDatastore::Client::VALID_OPTIONS.include?(k.to_sym) }
        end
        opts.merge!(project: project_name) unless client.project.name.to_sym == database_name.to_sym
        client.with(opts)
      end

      def collection
        datastore_client[collection_name]
      end
    end

  end  
end
