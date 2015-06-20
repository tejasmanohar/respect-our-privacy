class HomeController < ApplicationController
	def index
		@phone = Phone.new
	end
end