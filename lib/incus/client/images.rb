# frozen_string_literal: true

module Incus
  class Client
    module Images
      # List all images
      # @return [Hash] The parsed JSON response
      def images
        get("/images?recursion=1")
      end

      # Get a specific image by fingerprint
      # @param fingerprint [String] The fingerprint of the image
      # @return [Hash] The parsed JSON response
      def image(fingerprint)
        get("/images/#{fingerprint}")
      end

      # Get a list of image aliases
      # @return [Hash] The parsed JSON response
      def image_aliases
        get("/images/aliases?recursion=1")
      end

      # Get a specific image alias by name
      # @param name [String] The name of the image alias
      # @return [Hash] The parsed JSON response
      def image_alias(name)
        get("/images/aliases/#{name}")
      end
    end
  end
end
