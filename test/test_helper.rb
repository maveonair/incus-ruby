# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"

# Order matters!
require "httpx"
require "vcr"
require "webmock"
require "httpx/adapters/webmock"
require "webmock/minitest"

require "incus"

VCR.configure do |config|
  config.cassette_library_dir = "test/casettes"
  config.hook_into(:webmock)
end
