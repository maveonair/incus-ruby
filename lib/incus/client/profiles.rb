# frozen_string_literal: true

module Incus
  class Client
    module Profiles
      # List all profiles
      # @return [Hash] The parsed JSON response
      def profiles
        get("/profiles?recursion=1")
      end

      # Get a specific profile by name
      # @param name [String] The name of the profile to retrieve
      # @return [Hash] The parsed JSON response
      def profile(name)
        get("/profiles/#{name}")
      end
    end
  end
end
