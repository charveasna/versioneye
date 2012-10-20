class StatisticsController < ApplicationController

	def index
		@page = "statistics"
	end

	def proglangs
		stats = Product.get_language_stat_cached
		if stats.nil?
			stats = Product.get_language_stat
		end
		respond_to do |format|
			format.json{
				render :json => stats.sort {|a, b| b[1] <=> a[1]}
			}
		end
	end 

	def langtrends
		stats = Product.get_language_trend_cached
		if stats.nil?
			stats = Product.get_language_trend
		end
		respond_to do |format|
			format.json {
				render :json => stats
			}
		end
	end

end