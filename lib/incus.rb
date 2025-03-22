# frozen_string_literal: true

require "incus/client"
require "incus/version"

module Incus
  # Main module namespace for Incus gem

  # Create a new Incus client
  # @param base_url [String] The base URL for the Incus API (optional)
  # @param options [Hash] Options for the client
  # @return [Incus::Client] A new client instance
  def self.client(base_url = nil, **options)
    Client.new(base_url, **options)
  end
end
