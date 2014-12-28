module CategoryHelper

	def fetch_categories
		categories =  $redis.get("categories")
		if categories.nil?
			categories = Category.all.to_json
			$redis.set("categories", categories)
		end
		@categories = JSON.load categories
	end

end
