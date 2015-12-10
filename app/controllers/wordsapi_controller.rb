class WordsapiController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :html, :json, :xml
	require 'openssl'
	require 'open-uri'
	
	def search
		headers = { "X-Mashape-Key" => "YXc3MWWZ92mshFpOIiyNs5EKfY7wp17yprRjsnU3Uhfxt4grS2", "Accept" => "application/json" }	
		response = HTTParty.get("https://wordsapiv1.p.mashape.com/words/"+params[:search], :headers => headers)
		jresponse = response.parsed_response["results"]
		@test =  Array.new([response.parsed_response["word"]])
		if(jresponse.first["synonyms"])
			@test += jresponse.first['synonyms']
		end
		if(jresponse.first["hasTypes"])
			@test += jresponse.first['hasTypes']
		end
		render :json => @test
	end
	
	def test
		return "ten"
	end
end
