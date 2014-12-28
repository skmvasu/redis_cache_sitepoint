class CategoryController < ApplicationController

	include CategoryHelper

	def index
		fetch_categories
	end
end
