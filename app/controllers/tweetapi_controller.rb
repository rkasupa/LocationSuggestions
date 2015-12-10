class TweetapiController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :html, :json, :xml
	require 'openssl'
	
	def search
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key    = "7KUDR5oxUulQe6WMAITRu5DDf"
		  config.consumer_secret = "wZgJ9jkUWbfNE1zOC4HQAyMwLcJry56RX1cPu35Fxc9pCYyjHA"
		end	
		response = client.search(params[:search], {:result_type => "mixed", :geocode => params[:center][1]+","+params[:center][0]+",10km", :limit => 100} )
		render :json => response
	end
	
end