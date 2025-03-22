# frozen_string_literal: true

module Incus
  class Client
    module Metrics
      # Get metrics
      # @param target [String] The target to get metrics for (optional)
      # @return [Hash] The parsed JSON response
      def metrics(target = nil)
        return get("/metrics", raw: true) if target.nil?

        get("/metrics?target=#{target}", raw: true)
      end
    end
  end
end
