# frozen_string_literal: true

module Incus
  class Client
    module Server
      # Get server information and configuration
      # @param target [String] The target server to query (optional)
      # @return [Hash] The parsed JSON response
      def environment(target = nil)
        return get("") if target.nil?

        get("?target=#{target}")
      end

      # Get system resources
      # @param target [String] The target server to query (optional)
      # @return [Hash] The parsed JSON response
      def resources(target = nil)
        return get("/resources") if target.nil?

        get("/resources?target=#{target}")
      end
    end
  end
end
