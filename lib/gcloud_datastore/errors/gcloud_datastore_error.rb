# encoding: utf-8
module GcloudDatastore
  module Errors

    # Default parent error for all custom errors.
    class GcloudDatastoreError < StandardError

      attr_reader :problem, :summary, :resolution

      BASE_KEY = "gcloud_datastore.errors.messages"

      # Compose the message
      def compose_message(key, attributes)
        @problem = translate_problem(key, attributes)
        @summary = translate_summary(key, attributes)
        @resolution = translate_resolution(key, attributes)
        @problem_title = translate("message_title", {})
        @summary_title = translate("summary_title", {})
        @resolution_title = translate("resolution_title", {})


        "\n#{@problem_title}:\n  #{@problem}"+
        "\n#{@summary_title}:\n  #{@summary}"+
        "\n#{@resolution_title}:\n  #{@resolution}"
      end

      private

      def translate(key, options)
        ::I18n.translate("#{BASE_KEY}.#{key}", options)
      end

      def translate_problem(key, attributes)
        translate("#{key}.#{summary}", attributes)
      end

      def translate_summary(key, attributes)
        translate("#{key}.#{summary}", attributes)
      end

      def translate_resolution(key, attributes)
        translate("#{key}.#{summary}", attributes)
      end      
    end
  end
end
