# frozen_string_literal: true

module Incus
  class Client
    module Warnings
      # List all warnings
      # @return [Hash] The parsed JSON response
      def warnings
        get("/warnings?recursion=1")
      end

      # Get a specific warning by ID
      # @param id [String] The warning ID
      # @return [Hash] The parsed JSON response
      def warning(id)
        get("/warnings/#{id}")
      end
    end
  end
end
