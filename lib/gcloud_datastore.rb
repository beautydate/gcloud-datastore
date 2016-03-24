module GcloudDatastore
  
  require "gcloud"
  require "active_model"
  require 'active_support/concern'

  require_relative 'gcloud_datastore/findable'
  require_relative 'gcloud_datastore/composable'
  require_relative 'gcloud_datastore/document'
end
