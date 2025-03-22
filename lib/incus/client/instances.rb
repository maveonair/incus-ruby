# frozen_string_literal: true

module Incus
  class Client
    module Instances
      # List all instances
      # @return [Hash] The parsed JSON response
      def instances
        get("/instances?recursion=1")
      end

      # Get a specific instance by name
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance(name)
        get("/instances/#{name}?recursion=1")
      end

      # Get the access information for a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance_access(name)
        get("/instances/#{name}/access")
      end

      # Get the backups for a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance_backups(name)
        get("/instances/#{name}/backups?recursion=1")
      end

      # Get the console output for a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance_console(name)
        get("/instances/#{name}/console", raw: true)
      end

      # Get the debug memory information for a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance_debug_memory(name)
        get("/instances/#{name}/debug/memory")
      end

      # Get the log files for a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON responsej
      def instance_logs(name)
        get("/instances/#{name}/logs")
      end

      # Get the snapshots for a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance_snapshots(name)
        get("/instances/#{name}/snapshots?recursion=1")
      end

      # Get the state of a specific instance
      # @param name [String] The name of the instance
      # @return [Hash] The parsed JSON response
      def instance_state(name)
        get("/instances/#{name}/state")
      end
    end
  end
end
