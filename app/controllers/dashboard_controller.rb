class DashboardController < ApplicationController
	def index
		@artists = Artist.all
		@bands = Band.all
		@recordings = Recording.all
		@singles = Single.all
	end
end
