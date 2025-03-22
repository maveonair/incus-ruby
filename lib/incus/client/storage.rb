# frozen_string_literal: true

module Incus
  class Client
    module Storage
      # List all storage pools
      # @return [Hash] The parsed JSON response
      def storage_pools
        get("/storage-pools?recursion=1")
      end

      # Get a specific storage pool by name
      # @param name [String] The name of the storage pool to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool(name, target: nil)
        return get("/storage-pools/#{name}") if target.nil?

        get("/storage-pools/#{name}?target=#{target}")
      end

      # Get the resources for a storage pool
      # @param name [String] The name of the storage pool to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_resources(name, target: nil)
        return get("/storage-pools/#{name}/resources") if target.nil?

        get("/storage-pools/#{name}/resources?target=#{target}")
      end

      # List all storage pool buckets
      # @param name [String] The name of the storage pool to retrieve
      # @return [Hash] The parsed JSON response
      def storage_pool_buckets(name)
        get("/storage-pools/#{name}/buckets?recursion=1")
      end

      # Get a specific storage pool bucket by name
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param name [String] The name of the bucket to retrieve
      # @return [Hash] The parsed JSON response
      def storage_pool_bucket(pool_name, name)
        get("/storage-pools/#{pool_name}/buckets/#{name}")
      end

      # Get the keys for a storage pool bucket
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param name [String] The name of the bucket to retrieve
      # @return [Hash] The parsed JSON response
      def storage_pool_bucket_keys(pool_name, name)
        get("/storage-pools/#{pool_name}/buckets/#{name}/keys?rescurion=1")
      end

      # Get a specific storage pool bucket key by name
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param bucket_name [String] The name of the bucket to retrieve
      # @param name [String] The name of the key to retrieve
      # @return [Hash] The parsed JSON response
      def storage_pool_bucket_key(pool_name, bucket_name, name)
        get("/storage-pools/#{pool_name}/buckets/#{bucket_name}/keys/#{name}")
      end

      # List all storage pool volumes
      # @param name [String] The name of the storage pool to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_volumes(name, target: nil)
        return get("/storage-pools/#{name}/volumes?recursion=1") if target.nil?

        get("/storage-pools/#{name}/volumes?target=#{target}&recursion=1")
      end

      # List all storage pool volumes by type
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param type [String] The type of volume to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_volumes_by_type(pool_name, type, target: nil)
        get("/storage-pools/#{pool_name}/volumes/#{type}?recursion=1") if target.nil?

        get("/storage-pools/#{pool_name}/volumes/#{type}?target=#{target}&recursion=1")
      end

      # Get a specific storage pool volume by type and name
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param type [String] The type of volume to retrieve
      # @param name [String] The name of the volume to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_volume(pool_name, type, name, target: nil)
        return get("/storage-pools/#{pool_name}/volumes/#{type}/#{name}") if target.nil?

        get("/storage-pools/#{pool_name}/volumes/#{type}/#{name}?target=#{target}")
      end

      # Get the state of a storage pool volume
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param type [String] The type of volume to retrieve
      # @param name [String] The name of the volume to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_volume_state(pool_name, type, name, target: nil)
        return get("/storage-pools/#{pool_name}/volumes/#{type}/#{name}/state") if target.nil?

        get("/storage-pools/#{pool_name}/volumes/#{type}/#{name}/state?target=#{target}")
      end

      # List all snapshots for a storage pool volume
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param type [String] The type of volume to retrieve
      # @param name [String] The name of the volume to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_volume_snapshots(pool_name, type, name, target: nil)
        return get("/storage-pools/#{pool_name}/volumes/#{type}/#{name}/snapshots?recursion=1") if target.nil?

        get("/storage-pools/#{pool_name}/volumes/#{type}/#{name}/snapshots?target=#{target}&recursion=1")
      end

      # Get a specific storage pool volume snapshot by name
      # @param pool_name [String] The name of the storage pool to retrieve
      # @param type [String] The type of volume to retrieve
      # @param volume_name [String] The name of the volume to retrieve
      # @param name [String] The name of the snapshot to retrieve
      # @param target [String] The target to retrieve (optional)
      # @return [Hash] The parsed JSON response
      def storage_pool_volume_snapshot(pool_name, type, volume_name, name, target: nil)
        return get("/storage-pools/#{pool_name}/volumes/#{type}/#{volume_name}/snapshots/#{name}") if target.nil?

        get("/storage-pools/#{pool_name}/volumes/#{type}/#{volume_name}/snapshots/#{name}?target=#{target}")
      end
    end
  end
end
