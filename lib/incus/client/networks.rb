# frozen_string_literal: true

module Incus
  class Client
    module Networks
      # List all networks
      # @return [Hash] The parsed JSON response
      def networks
        get("/networks?recursion=1")
      end

      # Get a network by name
      # @param name [String] The name of the network
      # @param target [String] The target to use for the request (optional)
      # @return [Hash] The parsed JSON response
      def network(name, target: nil)
        return get("/networks/#{name}") if target.nil?

        get("/networks/#{name}?target=#{target}")
      end

      # List all DHCP leases for a network
      # @param name [String] The name of the network
      # @param target [String] The target to use for the request (optional)
      # @return [Hash] The parsed JSON response
      def network_leases(name, target: nil)
        return get("/networks/#{name}/leases") if target.nil?

        get("/networks/#{name}/leases?target=#{target}")
      end

      # Get the state of a network
      # @param name [String] The name of the network
      # @param target [String] The target to use for the request (optional)
      # @return [Hash] The parsed JSON response
      def network_state(name, target: nil)
        return get("/networks/#{name}/state") if target.nil?

        get("/networks/#{name}/state?target=#{target}")
      end
    end
  end
end
