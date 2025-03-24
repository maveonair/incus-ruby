# frozen_string_literal: true

require "test_helper"

class Incus::TestImage < Minitest::Test
  def test_returns_images
    VCR.use_cassette("images/list") do
      client = Incus.client("https://incus-dev:8443", verify_ssl: false)
      images = client.images
      assert_equal 2, images.count
    end
  end

  def test_returns_image
    VCR.use_cassette("images/get") do
      client = Incus.client("https://incus-dev:8443", verify_ssl: false)
      image = client.image("9c3d9f")
      assert_equal "Alpine", image["properties"]["os"]
    end
  end

  def test_return_image_aliases
    VCR.use_cassette("images/aliases") do
      client = Incus.client("https://incus-dev:8443", verify_ssl: false)
      aliases = client.image_aliases
      assert_equal 1, aliases.count
    end
  end

  def test_returns_image_alias
    VCR.use_cassette("images/alias") do
      client = Incus.client("https://incus-dev:8443", verify_ssl: false)
      image_alias = client.image_alias("alpine-edge")
      assert_equal "alpine-edge", image_alias["name"]
    end
  end
end
