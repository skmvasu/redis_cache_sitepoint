class Category
	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Paranoia

	after_save :reload_cache

	include CommonMeta

	def reload_cache
		$redis.del "categories"
	end
end
