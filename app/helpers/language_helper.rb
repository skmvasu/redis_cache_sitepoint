module LanguageHelper
	def fetch_languages
		languages =  $redis.get("languages")
		if languages.nil?
			languages = Language.all.to_json
			$redis.set("languages", languages)
		end
		@languages = JSON.load languages
	end
end
