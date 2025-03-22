# frozen_string_literal: true

module Incus
  class Client
    module Projects
      # List all projects
      # @return [Hash] The parsed JSON response
      def projects
        get("/projects?recursion=1")
      end

      # Get a specific project by name
      # @param name [String] The name of the project to retrieve
      # @return [Hash] The parsed JSON response
      def project(name)
        get("/projects/#{name}")
      end

      # Get the access control list for a project
      # @param name [String] The name of the project to retrieve
      # @return [Hash] The parsed JSON response
      def project_access(name)
        get("/projects/#{name}/access")
      end

      # Get the state of a project
      # @param name [String] The name of the project to retrieve
      # @return [Hash] The parsed JSON response
      def project_state(name)
        get("/projects/#{name}/state")
      end
    end
  end
end
