class LanguageController < ApplicationController

	include LanguageHelper

	def index
		fetch_languages
	end
end
