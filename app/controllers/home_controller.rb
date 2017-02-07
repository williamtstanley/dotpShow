class HomeController < ApplicationController

	def index
		@newestEpisode = Episode.last
		@episodes = Episode.last(4).reverse.slice(1,3)
	end

end
