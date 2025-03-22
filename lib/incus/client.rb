# frozen_string_literal: true

require "uri"
require "httpx"
require "json"
require "socket"

require "incus/client/images"
require "incus/client/instances"
require "incus/client/metrics"
require "incus/client/networks"
require "incus/client/profiles"
require "incus/client/projects"
require "incus/client/storage"
require "incus/client/server"
require "incus/client/warnings"

module Incus
  class Client
    include Images
    include Instances
    include Metrics
    include Networks
    include Profiles
    include Projects
    include Storage
    include Server
    include Warnings

    DEFAULT_SOCKET_PATH = "/var/lib/incus/incus.socket"
    DEFAULT_CERT_DIR = File.join(Dir.home, ".config", "incus")
    DEFAULT_CLIENT_CERT = File.join(DEFAULT_CERT_DIR, "client.crt")
    DEFAULT_CLIENT_KEY = File.join(DEFAULT_CERT_DIR, "client.key")

    # Initialize with either a base URL or use the default Unix socket
    # @param base_url [String] The base URL for the Incus API
    # @param project [String] The project to use for API requests (default: "default")
    # @param verify_ssl [Boolean] Whether to verify SSL certificates when using HTTPS (default: true)
    # @param client_cert [String] Path to client certificate file (default: ~/.config/incus/client.crt)
    # @param client_key [String] Path to client key file (default: ~/.config/incus/client.key)
    def initialize(base_url = nil, project: "default", verify_ssl: true, client_cert: nil, client_key: nil)
      @base_url = base_url
      @project = project
      @verify_ssl = verify_ssl
      @client_cert = client_cert || DEFAULT_CLIENT_CERT
      @client_key = client_key || DEFAULT_CLIENT_KEY
    end

    protected

    # Make a GET request to the Incus API
    # @param path [String] The API path to request
    # @return [Hash] The parsed JSON response
    def get(path, **options)
      response = if @base_url.nil?
        get_via_unix_socket(path)
      else
        get_via_http(path)
      end

      if response.error
        raise "Request failed with error: #{response.error}"
      end

      if options[:raw]
        return response.body.to_s
      end

      result = JSON.parse(response.body)
      result["metadata"]
    end

    private

    # Make GET request via Unix socket
    # @param path [String] The API path to request
    # @return [String] The response body
    def get_via_unix_socket(path)
      url = extend_url("http://localhost/1.0#{path}")
      agent = HTTPX.with_unix_socket(DEFAULT_SOCKET_PATH)
      agent.get(url)
    end

    # Make GET request via HTTP
    # @param path [String] The API path to request
    # @return [String] The response body
    def get_via_http(path)
      ssl_options = {}
      ssl_options[:verify_mode] = @verify_ssl ? OpenSSL::SSL::VERIFY_PEER : OpenSSL::SSL::VERIFY_NONE

      if File.exist?(@client_cert) && File.exist?(@client_key)
        ssl_options[:cert] = OpenSSL::X509::Certificate.new(File.read(@client_cert))
        ssl_options[:key] = OpenSSL::PKey::EC.new(File.read(@client_key))
      end

      agent = HTTPX.with(ssl: ssl_options)

      url = extend_url("#{@base_url}/1.0#{path}")
      agent.get(url)
    end

    def extend_url(url)
      parsed = URI.parse(url)
      query = if parsed.query
        CGI.parse(parsed.query)
      else
        {}
      end

      query["project"] = @project
      parsed.query = URI.encode_www_form(query)
      parsed.to_s
    end
  end
end
